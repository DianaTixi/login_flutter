import 'package:ejemplo/app/domain/response/login_response.dart';
import 'package:ejemplo/app/ui/global_widgets/dialogs/progress_dialogs.dart';
import 'package:ejemplo/app/ui/pages/login/controller/login_provider.dart';
import 'package:ejemplo/app/ui/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../global_widgets/dialogs/dialogs.dart';

Future<void> sendLoginFomr(BuildContext context) async {
  final controller = loginProvider.read;
  if (controller.formKey.currentState!.validate()) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    print("response ${response}");
    router.pop();
    if (response == LoginResponse.ok) {
      router.pushReplacementNamed(Routes.HOME);
    } else {
      Dialogs.alert(
        context,
        title: response.toString(),
      );
    }
  }
}
