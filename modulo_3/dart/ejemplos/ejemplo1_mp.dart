import 'dart:io';
void main() {
  stdout.write('Ingrese el numero para la tabla de multiplicar: ');
  int numero = int.parse(stdin.readLineSync()!);
  print('Tabla de multiplicar del $numero:');
  for (int i = 1; i <= 10; i++) {
    print('$numero x $i = ${numero * i}');
  }
}