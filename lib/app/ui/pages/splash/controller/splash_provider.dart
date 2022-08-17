import 'package:ejemplo/app/ui/global_controllers/session_controller.dart';
import 'package:flutter_meedu/meedu.dart';
import 'splash_controller.dart';

final splashProvider = SimpleProvider(
  (_) => SplashController(sessionProvider.read),
  //Se utiliza autodispose para estados globales, datos usuarios y carrito de compras
  //autoDispose: false,
);
