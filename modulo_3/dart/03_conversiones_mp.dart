void main() {
  int    peso    = 75;
  double pesoDec = peso.toDouble();
  String texto   = peso.toString();

  int    num1 = int.parse('80');
  double num2 = double.parse('12.5');

  int?    num3 = int.tryParse('abc');
  double? num4 = double.tryParse('99');

  Object valor = 'peso muerto';
  if (valor is String) {
    print(valor.length);
  }

  Object obj = 'Press banca';
  String str = obj as String;

  String? nullable = null;
  int longitud = nullable?.length ?? 0;
  print(longitud);

  print(double.infinity);
  print(double.nan);
  print(double.maxFinite);
}
