import 'package:crypto_price_tracker/views/crypto_view.dart';

class AppRoutes {
  static FluroRocter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/crypto',
      handler: Handler(
        handlerFunc: (context, parameters) {
          // Pass the parameters to the CryptoView when navigating to the /crypto route
          return CryptoView();
        },
      ),
    );
  }
}
