import 'dart:io';

Future<String> obtenerProgresoSemanal() async {
  await Future.delayed(Duration(milliseconds: 200));
  return '85% — meta alcanzada';
}

void main() async {
  print('Consultando progreso en Novafit...');
  final progreso = await obtenerProgresoSemanal();
  print('Progreso: $progreso');
  print('Consulta completada');
}
