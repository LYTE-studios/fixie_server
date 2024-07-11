import 'package:fixie_server/server.dart';
import 'package:sentry/sentry.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {
  Sentry.init(
    (options) {
      options.dsn =
          'https://fa2b7c080a4ff33fe2aa52e6e30df08b@o4506789659475968.ingest.us.sentry.io/4507582210179072';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => run(args),
  );
}
