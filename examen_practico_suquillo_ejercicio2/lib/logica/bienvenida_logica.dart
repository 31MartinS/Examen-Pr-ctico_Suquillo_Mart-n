import 'package:flutter/material.dart';
import '../ui/interfaz.dart';

void continuarConNombre(BuildContext context, String nombre) {
  if (nombre.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Interfaz(nombre: nombre),
      ),
    );
  }
}
