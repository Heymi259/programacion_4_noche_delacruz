import 'dart:io';
void main() {
  int minutos = 0;
  int totalMinutos = 0;
  int cantidadClientes = 0;
  print("=== REGISTRO DE ENTRENAMIENTO DEL GIMNASIO ===");
  stdout.write("Ingrese los minutos entrenados (0 para finalizar): ");
  minutos = int.parse(stdin.readLineSync()!);
  while (minutos > 0) {
    if (minutos < 30) {
      print("Entrenamiento insuficiente");
    } else if (minutos >= 30 && minutos <= 90) {
      print("Entrenamiento adecuado");
    } else {
      print("Entrenamiento intenso");
    }
    totalMinutos += minutos;
    cantidadClientes++;
    stdout.write("\nIngrese los minutos entrenados (0 para finalizar): ");
    minutos = int.parse(stdin.readLineSync()!);
  }
  print("\n=== REPORTE FINAL ===");
  print("Total de minutos entrenados: $totalMinutos");
  print("Cantidad de clientes registrados: $cantidadClientes");
  if (cantidadClientes > 0) {
    double promedio = totalMinutos / cantidadClientes;
    print("Promedio de minutos por cliente: ${promedio.toStringAsFixed(2)}");
  } else {
    print("No se registraron clientes.");
  }
}