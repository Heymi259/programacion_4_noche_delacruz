void main() {
  double pesoLevantado = 120;

  if (pesoLevantado > 150) {
    print('Avanzado');
  } else if (pesoLevantado > 80) {
    print('Intermedio');
  } else {
    print('Principiante');
  }

  String nivel = pesoLevantado > 150 ? 'Élite' : 'Regular';
  print(nivel);

  String? sede;
  String display = sede != null ? sede.toUpperCase() : 'Sin sede';

  String display2 = sede?.toUpperCase() ?? 'Sin sede';
  print(display2);

    String? nombre;

  if (nombre != null) {
    print(nombre.length);
  }

  print(nombre?.length);

  int longitud = nombre?.length ?? 0;
  print(longitud);
}
