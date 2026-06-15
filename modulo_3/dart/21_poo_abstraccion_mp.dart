abstract class Ejercicio {
  String get nombre;
  double calcularCalorias();
  double calcularVolumen();

  void describir() {
    print('$nombre — calorías: ${calcularCalorias().toStringAsFixed(2)}, '
          'volumen: ${calcularVolumen().toStringAsFixed(2)} kg');
  }
}

class PressBanca extends Ejercicio {
  final double peso;
  final int repeticiones;
  PressBanca(this.peso, this.repeticiones);

  @override String get nombre => 'Press Banca ($peso kg x $repeticiones)';
  @override double calcularCalorias() => peso * repeticiones * 0.1;
  @override double calcularVolumen() => peso * repeticiones;
}

class Sentadilla extends Ejercicio {
  final double peso;
  final int repeticiones;
  Sentadilla(this.peso, this.repeticiones);

  @override String get nombre => 'Sentadilla ($peso kg x $repeticiones)';
  @override double calcularCalorias() => peso * repeticiones * 0.15;
  @override double calcularVolumen() => peso * repeticiones;
}

void main() {
  final ejercicios = <Ejercicio>[PressBanca(60, 10), Sentadilla(80, 8)];
  for (final e in ejercicios) {
    e.describir();
  }
}
