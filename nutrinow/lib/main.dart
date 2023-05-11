import 'package:flutter/material.dart';
import 'package:nutrinow/pages/formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFF55AF31),
            onPrimary: Color(0xFFFFFFFF),
            secondary: Color(0xFF589D40),
            onSecondary: Color(0xFFFFFFFF),
            error: Color(0xFF750000),
            onError: Color(0xFFFFFFFF),
            background: Color(0xFFFFFFFF),
            onBackground: Color(0xFF0F0F0F),
            surface: Color(0xFF9A9A9A),
            onSurface: Color(0xFFFFFFFF)),
      ),
      home: const FormularioWidget(),
      routes: {},
    );
  }
}
