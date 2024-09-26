import 'package:dio/dio.dart';
import 'package:fixie_server/src/futures/daily_cron_future.dart';
import 'package:fixie_server/src/managers/mail_manager.dart';
import 'package:fixie_server/src/managers/notification_manager.dart';
import 'package:fixie_server/src/web/routes/root.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'package:serverpod_cloud_storage_s3/serverpod_cloud_storage_s3.dart'
    as s3;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  pod.registerFutureCall(
    NotificationFutureCall(),
    'SendNotification',
  );

  pod.registerFutureCall(
    DailyCronFuture(),
    'DailyCron',
  );

  DateTime now = DateTime.now();
  DateTime next = DateTime(now.year, now.month, now.day, 8, 0);

  pod.cancelFutureCall(next.toString());

  await pod.futureCallAtTime(
    'DailyCron',
    null,
    next,
    identifier: next.toString(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');
  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  pod.webServer.addRoute(auth.RouteGoogleSignIn(), '/googlesignin');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );
  pod.addCloudStorage(
    s3.S3CloudStorage(
      serverpod: pod,
      storageId: 'public',
      public: true,
      region: 'eu-central-1',
      bucket: 'fixie-public-storage-4138473',
      publicHost: 'storage.fixie.lytestudios.be',
    ),
  );

  auth.AuthConfig.set(
    auth.AuthConfig(
      userCanEditFullName: true,
      userCanEditUserImage: true,
      sendValidationEmail: (session, email, validationCode) async {
        UserLocales? locales = (await UserLocales.db
                .find(session, where: (t) => t.email.equals(email)))
            .firstOrNull;

        return await MailManager.sendMail(
          session,
          email: email,
          templates: MailManager.verificationTemplates,
          locale: locales?.locale ?? 'en',
          data: {
            "verification_code": validationCode,
          },
        );
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        final apiKey = session.serverpod.getPassword('mailjetApiKey');
        final secretKey = session.serverpod.getPassword('mailjetSecretKey');

        String myEmail = "hello@fixie.world";

        if (apiKey == null || secretKey == null) {
          return false;
        }

        String mailjetUrl =
            "https://$apiKey:$secretKey@api.mailjet.com/v3.1/send";

        Dio dio = Dio();

        Response response = await dio.post(
          mailjetUrl,
          data: {
            "Messages": [
              {
                "TemplateID": 6209328,
                "From": {
                  "Email": myEmail,
                  "Name": "Fixie",
                },
                "To": [
                  {
                    "Email": userInfo.email,
                  }
                ],
                "TemplateLanguage": true,
                "Variables": {
                  "verification_code": validationCode,
                },
              },
            ],
          },
        );

        if (response.statusCode == 200) {
          return true;
        }

        return false;
      },
    ),
  );

  // Start the server.
  await pod.start();
}
