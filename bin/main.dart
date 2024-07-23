import 'package:fixie_server/server.dart';
import 'package:sentry/sentry.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {
  Sentry.init(
    (options) {
      options.dsn =
          'https://989ced15e6ac1dc6a970834037e19345@o4506789659475968.ingest.us.sentry.io/4507582246879232';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => run(args),
  );
}
