import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:ejemplo/app/domain/models/regla.dart';
import 'package:ejemplo/app/ui/global_controllers/session_controller.dart';
import 'package:ejemplo/app/ui/pages/home/controller/home_controller.dart';
import 'package:ejemplo/app/ui/pages/reglas/controller/reglas_provider.dart';
import 'package:ejemplo/app/ui/pages/reglas/reglas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/ui.dart';

import '../../routes/routes.dart';
import '../../routes/routes.dart';
import '../home/controller/home_provider.dart';

class ReglasPage extends StatelessWidget {
  const ReglasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List<Regla> _reglas = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button'),
      ),
      body: Center(
        // The Consumer widget listen the changes in your CounterController
        // and rebuild the widget when is need it
        child: Consumer(builder: (_, ref, __) {
          print("========================================entre");
          final controller = ref.watch(reglasProvider);
          return ListView.builder(
            itemCount: controller.regla.length,
            itemBuilder: (context, index) {
              return Text("data");
              // return ListTile(
              //   title: Text(
              //     "${controller.regla[index].regNombre}",
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // you can use the read method to access to your CounterController
          ;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
