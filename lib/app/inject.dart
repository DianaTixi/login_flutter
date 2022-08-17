import 'package:ejemplo/app/data/data_source/remote/getmenu_api.dart';
import 'package:ejemplo/app/data/data_source/remote/authentication_api.dart';
import 'package:ejemplo/app/data/data_source/remote/local/authentication_client.dart';
import 'package:ejemplo/app/data/helpers/http.dart';
import 'package:ejemplo/app/data/repositories_impl/account_repository_impl.dart';
import 'package:ejemplo/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:ejemplo/app/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'domain/repositories/account_repository.dart';

Future<void> injectDependencies() async {
  final http = Http(baseUrl: 'https://arca.icreativa.com.ec/');
  final authClient = AuthenticationClient(
    const FlutterSecureStorage(),
  );

  Get.lazyPut<AutheticationRepository>(
    () => AutheticationRepositoryImpl(
      AuthenticationApi(http),
      authClient,
    ),
  );

  Get.lazyPut<MenuRepository>(
    () => MenuRepositoryImpl(MenuApi(http, authClient)),
  );
}
