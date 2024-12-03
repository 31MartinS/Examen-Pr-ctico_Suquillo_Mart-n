import 'dart:math'; // Importa el paquete math

double calcularDistancia(double x1, double y1, double x2, double y2) {
  final double dx = x1 - x2;
  final double dy = y1 - y2;
  return sqrt(dx * dx + dy * dy); // Usa sqrt para calcular la raíz cuadrada
}
