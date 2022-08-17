import 'package:ejemplo/app/ui/global_controllers/session_controller.dart';
import 'package:ejemplo/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import 'controller/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('App Usuarios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (_, ref, __) {
              final controller = ref.watch(sessionProvider);
              return Text(" ${controller.menu?.toJson()}");
            })
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Menu1"),
              onTap: () => {},
            ),
            ListTile(
              title: Text("Menu2"),
              onTap: () => {},
            )
          ],
        ),
      ),
    );
  }
}
