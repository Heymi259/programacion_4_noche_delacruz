String calcularCalorias(String ejercicio, int peso, [int? repeticiones]) {
  if (repeticiones != null) {
    return '$ejercicio — $peso kg x $repeticiones reps = ${peso * repeticiones} kcal';
  }
  return '$ejercicio — $peso kg';
}

String calcularCaloriasV2(String ejercicio, int peso, [int repeticiones = 10]) {
  return '$ejercicio — $peso kg x $repeticiones reps = ${peso * repeticiones} kcal';
}

void main() {
  print(calcularCalorias('Press Banca', 60));
  print(calcularCalorias('Press Banca', 60, 12));
  print(calcularCaloriasV2('Sentadilla', 80));
}
