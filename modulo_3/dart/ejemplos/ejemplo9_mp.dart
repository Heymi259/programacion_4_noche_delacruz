import 'dart:io';
void main() {
  int total = 0, ventas;
  double promedio;
  print("VENTAS DE LA SEMANA");
  for (int i = 1; i <= 7; i++) {
    stdout.write("Ventas del dÃ­a $i: ");
    ventas = int.parse(stdin.readLineSync()!);
    total += ventas;
  }
  promedio = total / 7;
  print("\nTotal de ventas: $total");
  print("Promedio diario: $promedio");
  if (promedio < 10) {
    print("Bajo rendimiento");
  } else if (promedio <= 25) {
    print("Rendimiento normal");
  } else {
    print("Alto rendimiento");
  }
}