void main() {
  var nombre = 'Ana';
  var edad = 28;
  var precio = 89.99;
  var activo = true;
  String apellido = 'GarcÃ­a';
  int stock = 100;
  double pi = 3.14159;
  bool visible = false;
  final ciudad = 'Madrid';
  const gravedad = 9.8;
  const pi2 = 3.14159;
  final ahora = DateTime.now();
  print('$nombre $apellido tiene $edad aÃ±os en $ciudad');
  var contador = 0;
  contador = 1;
  print('Contador: $contador');
  final lista = [1, 2, 3];
  lista.add(4);
  print('Lista final: $lista');
  const colores = ['rojo', 'azul'];
  String nombre2 = 'Ana';
  String? apellido2 = null;
  apellido2 = 'GarcÃ­a';
  String? ciudad2;
  print(ciudad2?.length);
  String resultado = ciudad2 ?? 'Sin ciudad';
  print(resultado);
  ciudad2 = 'Quito';
  String ciudadSegura = ciudad2!;
  print(ciudadSegura);
  if (apellido2 != null) {
    print(apellido2.length);
  }
  late String token;
  token = 'abc123';
  print(token);
  print(precio);
  print(activo);
  print(stock);
  print(pi);
  print(visible);
  print(gravedad);
  print(pi2);
  print(ahora);
  print(nombre2);
}