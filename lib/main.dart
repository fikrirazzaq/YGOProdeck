import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/features/favorites/favorites.dart';
import 'src/shared/shared.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Favorite>(FavoriteAdapter());
  await Hive.openBox<Favorite>('favorite_box');

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
        primarySwatch: Colors.orange,
      ),
      initialRoute: routeMain,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
