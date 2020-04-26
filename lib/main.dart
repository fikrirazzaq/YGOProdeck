import 'package:YGOProdeck/src/shared/routes/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiBlocProvider(
      providers: providers,
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yu-Gi-Oh! Prodeck',
      theme: ThemeData(
        fontFamily: 'Muli',
        primaryColor: Colors.white,
      ),
      initialRoute: routeHome,
      onGenerateRoute: generateRoute,
    );
  }
}
