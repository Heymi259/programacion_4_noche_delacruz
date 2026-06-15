void main() {
  final calcularIMC = (double peso, double altura) => peso / (altura * altura);
  print(calcularIMC(75.0, 1.75));

  final calcularCalorias = (double peso, double minutos) {
    final kcal = peso * 0.1 * minutos;
    return kcal;
  };
  print(calcularCalorias(75.0, 45.0));

  final pesos = [20, 40, 60, 80, 100];
  pesos.sort((a, b) => b.compareTo(a));
  print(pesos);
}
