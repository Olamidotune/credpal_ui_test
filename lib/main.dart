import 'package:credpal_ui_test/presentation/screens/home.dart';
import 'package:credpal_ui_test/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'CredPal UI Test',
          debugShowCheckedModeBanner: false,
          routes: AppRoutes.routes,
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
