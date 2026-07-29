import 'dart:io';
void main() {
  print("Ingrese un nÃºmero:");
  int numero = int.parse(stdin.readLineSync()!);
  if (numero > 0) {
    print("El nÃºmero es positivo");
  } else if (numero < 0) {
    print("El nÃºmero es negativo");
  } else {
    print("El nÃºmero es cero");
  }
}