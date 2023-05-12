import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nutrinow/controllers/form_controller.dart';
import 'package:nutrinow/pages/firebaseCentral.dart';
import 'package:nutrinow/pages/formulario.dart';
import 'package:nutrinow/pages/register.dart';
import 'config/configuration.dart';
import 'controllers/auth_controller.dart';
import 'pages/editcomida.dart';
import 'pages/home.dart';
import 'pages/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: Configuration.apiKey,
    authDomain: Configuration.authDomain,
    databaseURL: Configuration.databaseURL,
    projectId: Configuration.projectId,
    // storageBucket: Configuration.storageBucket,
    messagingSenderId: Configuration.messagingSenderId,
    appId: Configuration.appId,
    // measurementId: Configuration.measurementId),
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    Get.put(FormController());
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF55AF31),
            onPrimary: Color(0xFFFFFFFF),
            secondary: Color(0xFF589D40),
            onSecondary: Color(0xFFFFFFFF),
            tertiary: Color(0xFF0A6C19),
            error: Color(0xFF750000),
            onError: Color(0xFFFFFFFF),
            background: Color(0xFFFFFFFF),
            onBackground: Color(0xFF0F0F0F),
            surface: Color(0xFF9A9A9A),
            onSurface: Color(0xFFFFFFFF)),
      ),
      home: const FirebaseCentral(),
      routes: {
        "/formulario": (context) => const FormularioWidget(),
        "/home": (context) => const HomeWidget(),
        "/editcomida": (context) => const EditComidaWidget(),
        "/start": (context) => const StartWidget(),
        "/register": (context) => const RegisterWidget()
      },
    );
  }
}
