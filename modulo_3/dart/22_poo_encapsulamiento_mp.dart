abstract class Forma {
  String get nombre;
  double calcularArea();
  double calcularPerimetro();
  void describir() {
    print('$nombre â€” Ã¡rea: ${calcularArea().toStringAsFixed(2)}, '
          'perÃ­metro: ${calcularPerimetro().toStringAsFixed(2)}');
  }
}
class Circulo extends Forma {
  final double radio;
  Circulo(this.radio);
  @override String get nombre => 'CÃ­rculo (r=$radio)';
  @override double calcularArea()      => 3.1416 * radio * radio;
  @override double calcularPerimetro() => 2 * 3.1416 * radio;
}
class Rectangulo extends Forma {
  final double ancho, alto;
  Rectangulo(this.ancho, this.alto);
  @override String get nombre => 'RectÃ¡ngulo (${ancho}x$alto)';
  @override double calcularArea()      => ancho * alto;
  @override double calcularPerimetro() => 2 * (ancho + alto);
}
void main() {
  final formas = <Forma>[Circulo(5), Rectangulo(4, 7)];
  for (final f in formas) {
    f.describir();
  }
}