void main() {
  for (int i = 1; i <= 5; i++) {
    print('Serie $i');
  }

  for (int i = 0; i <= 100; i += 25) {
    print('Progreso rutina: $i%');
  }

  for (int i = 5; i >= 1; i--) {
    print('Descanso: $i seg');
  }

    final ejercicios = ['Press Banca', 'Remo', 'Sentadilla', 'Peso Muerto', 'Dominadas'];

  for (final ejercicio in ejercicios) {
    print(ejercicio);
  }

  ejercicios.forEach((e) => print(e.toLowerCase()));

  final series = {'Press Banca': 4, 'Remo': 3, 'Sentadilla': 5};
  for (final entrada in series.entries) {
    print('${entrada.key} → ${entrada.value} series');
  }
}
