import 'dart:io';
Future<String> obtenerIpPublica() async {
  await Future.delayed(Duration(milliseconds: 200));
  return '203.0.113.42';
}
void main() async {
  print('Consultando IP...');
  final ip = await obtenerIpPublica();
  print('IP pÃºblica: $ip');
  print('Consulta completada');
}