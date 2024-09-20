import 'package:dio/dio.dart';
import 'package:serverpod/server.dart';

class MailManager {
  static Map<String, int> verificationTemplates = {
    'en': 6209328,
    'nl': 6209328,
  };

  static Future<bool> sendMail(
    Session session, {
    required String email,
    required Map<String, int> templates,
    String locale = 'en',
    Map<String, String>? data,
  }) async {
    assert(templates['en'] != null);

    int templateId = templates['en']!;

    if (templates.keys.contains(locale) == false) {
      templateId = templates[locale] ?? templateId;
    }

    final apiKey = session.serverpod.getPassword('mailjetApiKey');
    final secretKey = session.serverpod.getPassword('mailjetSecretKey');

    String myEmail = "hello@fixie.world";

    if (apiKey == null || secretKey == null) {
      return false;
    }

    String mailjetUrl = "https://$apiKey:$secretKey@api.mailjet.com/v3.1/send";

    Dio dio = Dio();

    Response response = await dio.post(
      mailjetUrl,
      data: {
        "Messages": [
          {
            "TemplateID": templateId,
            "From": {
              "Email": myEmail,
              "Name": "Fixie",
            },
            "To": [
              {
                "Email": email,
              }
            ],
            "TemplateLanguage": true,
            "Variables": data ?? {},
          },
        ],
      },
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
