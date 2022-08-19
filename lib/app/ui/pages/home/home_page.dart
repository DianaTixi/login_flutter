import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:ejemplo/app/ui/global_controllers/session_controller.dart';
import 'package:ejemplo/app/ui/pages/home/controller/home_controller.dart';
import 'package:ejemplo/app/ui/pages/reglas/reglas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/ui.dart';

import '../../routes/routes.dart';
import '../../routes/routes.dart';
import 'controller/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Menu> _menu = [];
    return Scaffold(
      appBar: AppBar(
        title: new Text('App Usuarios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(""),
            TextButton(
              onPressed: () async {
                await homeProvider.read.getMenus();
              },
              child: Text("Menus"),
            ),
            //Text("Numero Menus ${homeProvider.read.numeromenus}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.pushReplacementNamed(Routes.LOGIN);
        },
        child: Icon(Icons.logout),
      ),
      drawer: Drawer(
        child: Consumer(
          builder: (_, ref, __) {
            final controller = ref.watch(homeProvider);
            return Expanded(
                child: ListView.builder(
                    itemCount: controller.menues.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          "${controller.menues[index].dmeTexto}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.menues[index].hijos.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    "${controller.submenu[index].dmeTexto}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReglasPage()))
                                  },
                                );
                              })
                        ],
                      );
                    }));
          },
        ),
      ),
    );
  }
}
