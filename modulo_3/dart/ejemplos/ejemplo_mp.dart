import 'dart:io';
void main() {
  int numero = 1;
  int suma = 0;
  while (numero != 0) {
    print("imgrese el numero:");
    numero = int.parse(stdin.readLineSync()!);
    suma = suma + numero;
  }
  print("la suma es : $suma");
}