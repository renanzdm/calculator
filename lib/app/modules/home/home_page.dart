import 'package:flutter/material.dart';
import 'package:flutter_calculator/app/modules/home/home_controller.dart';
import 'package:flutter_calculator/app/shared/components/display/display_widget.dart';
import 'package:flutter_calculator/app/shared/components/keyboard/keyboard_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return DisplayWidget(text: controller.value);
            },
          ),
          KeyboardWidget(cb: controller.apllyComand),
        ],
      ),
    );
  }
}
