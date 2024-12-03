import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../logica/logica.dart';

class Interfaz extends StatefulWidget {
  final String nombre;

  const Interfaz({super.key, required this.nombre});

  @override
  State<Interfaz> createState() => _InterfazState();
}

class _InterfazState extends State<Interfaz> {
  final TextEditingController _x1Controller = TextEditingController();
  final TextEditingController _y1Controller = TextEditingController();
  final TextEditingController _x2Controller = TextEditingController();
  final TextEditingController _y2Controller = TextEditingController();

  String _resultado = '';
  String? _errorX1, _errorY1, _errorX2, _errorY2;

  void _calcularDistancia() {
    setState(() {
      _errorX1 = _validarCampo(_x1Controller.text, 'x1');
      _errorY1 = _validarCampo(_y1Controller.text, 'y1');
      _errorX2 = _validarCampo(_x2Controller.text, 'x2');
      _errorY2 = _validarCampo(_y2Controller.text, 'y2');
    });

    if (_errorX1 == null && _errorY1 == null && _errorX2 == null && _errorY2 == null) {
      final double x1 = double.parse(_x1Controller.text);
      final double y1 = double.parse(_y1Controller.text);
      final double x2 = double.parse(_x2Controller.text);
      final double y2 = double.parse(_y2Controller.text);

      final double distancia = calcularDistancia(x1, y1, x2, y2);

      setState(() {
        _resultado = 'La distancia es: ${distancia.toStringAsFixed(2)}';
      });
    }
  }

  String? _validarCampo(String value, String campo) {
    if (value.trim().isEmpty) {
      return 'El campo $campo no puede estar vacío.';
    }
    if (double.tryParse(value) == null) {
      return 'El campo $campo debe ser un número válido.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido, ${widget.nombre}!'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ingrese las coordenadas de los puntos:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ..._buildCoordenadas(),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _calcularDistancia,
                  icon: const Icon(FontAwesomeIcons.calculator),
                  label: const Text('Calcular distancia'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                if (_resultado.isNotEmpty)
                  Text(
                    _resultado,
                    style: const TextStyle(fontSize: 18, color: Colors.green),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCoordenadas() {
    return [
      _buildTextField('x1', _x1Controller, _errorX1),
      const SizedBox(height: 10),
      _buildTextField('y1', _y1Controller, _errorY1),
      const SizedBox(height: 10),
      _buildTextField('x2', _x2Controller, _errorX2),
      const SizedBox(height: 10),
      _buildTextField('y2', _y2Controller, _errorY2),
    ];
  }

  Widget _buildTextField(String label, TextEditingController controller, String? error) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: const Icon(FontAwesomeIcons.locationArrow, color: Colors.amber),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.amber),
          errorText: error,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
