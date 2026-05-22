import 'dart:io';

void main() {
  int horas, pacientes, totalPacientes = 0, doctores = 0;

  stdout.write("Horas trabajadas (0 para salir): ");
  horas = int.parse(stdin.readLineSync()!);

  while (horas > 0) {

    stdout.write("Pacientes atendidos: ");
    pacientes = int.parse(stdin.readLineSync()!);

    double porHora = pacientes / horas;

    if (porHora < 3) {
      print("Atención lenta");
    } else if (porHora <= 6) {
      print("Atención normal");
    } else {
      print("Atención rápida");
    }

    totalPacientes += pacientes;
    doctores++;

    stdout.write("\nHoras trabajadas (0 para salir): ");
    horas = int.parse(stdin.readLineSync()!);
  }

  print("\nTotal de pacientes: $totalPacientes");
  print("Doctores registrados: $doctores");

  if (doctores > 0) {
    print("Promedio de pacientes por doctor: ${totalPacientes / doctores}");
  }
}