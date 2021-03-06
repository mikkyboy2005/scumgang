import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import "./ScopeManage.dart";
import './Home.dart';
import 'Details.dart';
import "Cart.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Main());
}

class Main extends StatelessWidget {
  AppModel appModel = AppModel();

  final routes = <String, WidgetBuilder>{
    Home.route: (BuildContext context) => Home(),
    Details.route: (BuildContext context) => Details(),
    Cart.route: (BuildContext context) => Cart()
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<AppModel>(
      model: appModel,
      child: MaterialApp(
        home: Home(
          appModel: appModel,
        ),
        routes: routes,
        theme: ThemeData(primaryColor: Colors.white),
      ),
    );
  }
}
