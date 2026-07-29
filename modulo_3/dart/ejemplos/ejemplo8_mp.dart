import 'dart:io';
void main() {
  int vuelos, pasajeros, retraso;
  int totalPasajeros = 0, totalRetraso = 0, agentes = 0, totalVuelos = 0;
  stdout.write("Vuelos atendidos (0 para salir): ");
  vuelos = int.parse(stdin.readLineSync()!);
  while (vuelos > 0) {
    stdout.write("Pasajeros procesados: ");
    pasajeros = int.parse(stdin.readLineSync()!);
    stdout.write("Minutos de retraso: ");
    retraso = int.parse(stdin.readLineSync()!);
    double pasajerosVuelo = pasajeros / vuelos;
    double retrasoVuelo = retraso / vuelos;
    print("Pasajeros por vuelo: $pasajerosVuelo");
    print("Retraso por vuelo: $retrasoVuelo");
    if (pasajerosVuelo < 50) {
      print("Baja eficiencia");
    } else if (pasajerosVuelo <= 120) {
      print("Eficiencia normal");
    } else {
      print("Alta eficiencia");
    }
    totalPasajeros += pasajeros;
    totalRetraso += retraso;
    totalVuelos += vuelos;
    agentes++;
    stdout.write("\nVuelos atendidos (0 para salir): ");
    vuelos = int.parse(stdin.readLineSync()!);
  }
  print("\nTotal pasajeros: $totalPasajeros");
  print("Total retraso acumulado: $totalRetraso");
  print("Agentes registrados: $agentes");
  if (agentes > 0) {
    print("Promedio pasajeros por agente: ${totalPasajeros / agentes}");
  }
  if (totalVuelos > 0) {
    print("Promedio general retraso por vuelo: ${totalRetraso / totalVuelos}");
  }
}