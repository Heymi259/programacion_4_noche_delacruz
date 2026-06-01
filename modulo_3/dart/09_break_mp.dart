void main() {
  final pesos = [20, 40, 60, -1, 80, 100, -1, 120];

  print('=== Procesando con continue ===');
  for (final peso in pesos) {
    if (peso < 0) {
      print('Peso inválido, se omite');
      continue;
    }
    print('Levantando $peso kg');
  }

  print('\n=== Procesando con break ===');
  for (final peso in pesos) {
    if (peso < 0) {
      print('Error crítico — deteniendo rutina');
      break;
    }
    print('Levantando $peso kg');
  }
}
