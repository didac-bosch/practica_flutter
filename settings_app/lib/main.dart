import 'package:flutter/material.dart';
import 'package:settings_app/settings_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SettingsScreen(),
        appBar: AppBar(title: Text("Configuración")),
      ),
    );
  }
}
