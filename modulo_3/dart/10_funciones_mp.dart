void saludar() {
  print('Bienvenido a Novafit Gym');
}

void saludoConParametro(String nombre) {
  print('Hola $nombre, bienvenido a Novafit');
}

int obtenerSesiones() {
  return 15;
}

int sumarSets(int a, int b) {
  return a + b;
}

int calcularVolumen(int peso, int reps) => peso * reps;

void saludarOpcional(String nombre, [String? horario]) {
  if (horario != null) {
    print('$nombre entrena en el horario $horario');
  } else {
    print('$nombre no tiene horario asignado');
  }
}

void saludarOpcionalNamed(String nombre, {String? horario}) {
  if (horario != null) {
    print('$nombre entrena en el horario $horario');
  } else {
    print('$nombre no tiene horario asignado');
  }
}

void main() {
  saludar();
  saludoConParametro('Pedro Pérez');
  int sesiones = obtenerSesiones();
  print(sesiones);
  print('Total sesiones: ${obtenerSesiones()}');
  print('Total sets: ${sumarSets(4, 3)}');
  print('Volumen total: ${calcularVolumen(80, 10)} kg');
  saludarOpcional('Juan');
  saludarOpcional('Juan', 'Matutino');
  saludarOpcionalNamed('María');
  saludarOpcionalNamed('María', horario: 'Vespertino');
}
