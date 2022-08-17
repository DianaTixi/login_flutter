import 'package:ejemplo/app/ui/pages/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'controller/splash_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
        provider: splashProvider,
        onDispose: (_, controller) {
          splashProvider.dispose();
        },
        onChange: (_, controller) {
          final routeName = controller.routeName;
          if (routeName != null) {
            router.pushReplacementNamed(routeName,
                transition: router.transition);
          }
        },
        builder: (_, __) => const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            )));
  }
}
