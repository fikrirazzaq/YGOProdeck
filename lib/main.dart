import 'package:YGOProdeck/src/shared/routes/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YGO Prodeck',
      theme: ThemeData(
        fontFamily: 'Muli',
        primaryColor: Colors.orange,
      ),
      initialRoute: routeHome,
      onGenerateRoute: generateRoute,
    );
  }
}
