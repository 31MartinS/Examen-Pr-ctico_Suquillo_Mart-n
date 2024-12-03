import 'package:flutter/material.dart';
import 'ui/bienvenida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distancia Euclídea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Bienvenida(),
    );
  }
}
