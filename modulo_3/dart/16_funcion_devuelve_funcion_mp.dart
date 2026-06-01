int Function(int) crearMultiplicadorPeso(int factor) {
  return (int n) => n * factor;
}

void main() {
  final x2   = crearMultiplicadorPeso(2);
  final x3   = crearMultiplicadorPeso(3);
  final x10  = crearMultiplicadorPeso(10);

  print(x2(40));
  print(x3(40));
  print(x10(40));

  bool Function(double) crearValidadorCategoria(double min, double max) {
    return (peso) => peso >= min && peso <= max;
  }

  final esLigero  = crearValidadorCategoria(0, 50);
  final esPesado  = crearValidadorCategoria(100, double.infinity);

  print(esLigero(35.0));
  print(esPesado(120.0));
  print(esPesado(45.0));
}
