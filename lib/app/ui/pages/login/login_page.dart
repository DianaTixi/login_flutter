import 'package:ejemplo/app/domain/response/login_response.dart';
import 'package:ejemplo/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:ejemplo/app/ui/global_widgets/dialogs/progress_dialogs.dart';
import 'package:ejemplo/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'controller/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = loginProvider.read;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Alias"),
                      ),
                      onChanged: controller.onEmailChange,
                      validator: (text) {
                        final alias = text ?? "";
                        if (alias.replaceAll(" ", "").length >= 6) {
                          return null;
                        }
                        return "Invalido";
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Contraseña"),
                      ),
                      onChanged: controller.onPasswordChange,
                      validator: (text) {
                        final password = text ?? "";
                        if (password.replaceAll(" ", "").length >= 6) {
                          return null;
                        }
                        return "Invalido";
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        ProgressDialog.show(context);
                        final response = controller.sendLoginForm();
                        router.pop();
                        if (response == LoginResponse.ok) {
                          router.pushReplacementNamed(Routes.HOME);
                        } else {
                          Dialogs.alert(
                            context,
                            title: response.toString(),
                          );
                          router.pushReplacementNamed(Routes.LOGIN);
                        }
                      },
                      child: Text("Iniciar Sesion"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
