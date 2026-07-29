void main() {
  int temperatura = 38;
  if (temperatura > 37.5) {
    print('Fiebre');
  } else if (temperatura > 36) {
    print('Normal');
  } else {
    print('Hipotermia');
  }
  String estado = temperatura > 37.5 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);
  String? ciudad;
  String display = ciudad != null ? ciudad.toUpperCase() : 'Sin ciudad';
  String display2 = ciudad?.toUpperCase() ?? 'Sin ciudad';
  print(display2);
    String? nombre;
  if (nombre != null) {
    print(nombre.length);
  }
  print(nombre?.length);
  int longitud = nombre?.length ?? 0;
  print(longitud);
}