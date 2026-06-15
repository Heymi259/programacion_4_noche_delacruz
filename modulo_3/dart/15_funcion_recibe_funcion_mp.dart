List<int> filtrarPesos(List<int> lista, bool Function(int) criterio) {
  return lista.where(criterio).toList();
}

bool esPesado(int n)    => n > 100;
bool esLigero(int n) => n < 50;

void main() {
  final datos = [20, 45, 80, 120, 150, 35, 90, 200];

  print(filtrarPesos(datos, esPesado));
  print(filtrarPesos(datos, esLigero));

  print(filtrarPesos(datos, (n) => n % 20 == 0));
}
