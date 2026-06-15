int doblarPeso(int n)  => n * 2;
int triplicarPeso(int n) => n * 3;

void main() {
  int Function(int) operacion;

  operacion = doblarPeso;
  print(operacion(40));

  operacion = triplicarPeso;
  print(operacion(40));

  final transformaciones = <int Function(int)>[doblarPeso, triplicarPeso];
  for (final fn in transformaciones) {
    print(fn(25));
  }
}
