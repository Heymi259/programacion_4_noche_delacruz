import 'dart:io';

void main() {
  print('Ingrese su nombre de socio:');
  String? nombre = stdin.readLineSync();
  print('Bienvenido a Novafit, $nombre');

  print('Ingrese su peso en kg:');
  double peso = double.parse(stdin.readLineSync()!);
  print('Peso registrado: $peso kg');

  print('Ingrese su edad:');
  int edad = int.parse(stdin.readLineSync()!);
  print('Edad: $edad años');
}
