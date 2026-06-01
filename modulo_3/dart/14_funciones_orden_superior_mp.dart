void main() {
  final pesos = [20.0, 40.5, 60.0, 80.0];

  final pesosConAumento = pesos.map((p) => p * 1.1);
  print(pesosConAumento.toList());

  final ejercicios = ['Press Banca', 'Sentadilla', 'Peso Muerto'];
  final rutinas = ejercicios.map((e) => 'Novafit: $e');
  print(rutinas.toList());
}
