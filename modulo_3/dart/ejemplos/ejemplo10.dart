import 'dart:io';

void main() {
  double km, totalKm = 0;

  print("REGISTRO DE VIAJES");

  for (int i = 1; i <= 5; i++) {

    stdout.write("Kilómetros del viaje $i: ");
    km = double.parse(stdin.readLineSync()!);

    if (km < 50) {
      print("Ruta corta");
    } else if (km <= 150) {
      print("Ruta media");
    } else {
      print("Ruta larga");
    }

    totalKm += km;
  }

  double combustible = totalKm / 12;
  double promedio = totalKm / 5;

  print("\nTotal de kilómetros: $totalKm");
  print("Combustible estimado: $combustible litros");
  print("Promedio por viaje: $promedio km");
}