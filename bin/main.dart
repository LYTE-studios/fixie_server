import 'package:fixie_server/server.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// This is the starting point for your Serverpod server. Typically, there is
/// no need to modify this file.
void main(List<String> args) {
  SentryFlutter.init(
    (options) {
      options.dsn =
          'https://fa2b7c080a4ff33fe2aa52e6e30df08b@o4506789659475968.ingest.us.sentry.io/4507582210179072';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => run(args),
  );
}
