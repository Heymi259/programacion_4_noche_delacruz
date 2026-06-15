int factorialPeso(int n) {
  if (n <= 1) return 1;
  return n * factorialPeso(n - 1);
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int contarEjercicios(Map<String, dynamic> rutina) {
  int total = 0;
  for (final entrada in rutina.entries) {
    if (entrada.value is Map) {
      total += contarEjercicios(entrada.value as Map<String, dynamic>);
    } else {
      total++;
    }
  }
  return total;
}

void main() {
  print(factorialPeso(5));

  print(fibonacci(10));

  final rutinaNovafit = {
    'Pecho': {
      'Press Banca': {'series': 4, 'reps': 10},
      'Aperturas': {'series': 3, 'reps': 12},
    },
    'Espalda': {
      'Remo': {'series': 4, 'reps': 8},
      'Dominadas': {'series': 3, 'reps': 10},
    },
    'Piernas': {
      'Sentadilla': {'series': 5, 'reps': 5},
    },
    'Cardio': '20 min',
  };

  print('Total de ejercicios: ${contarEjercicios(rutinaNovafit)}');
}
