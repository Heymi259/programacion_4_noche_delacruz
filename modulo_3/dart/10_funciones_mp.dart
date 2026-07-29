void saludar() {
  print('Hola mundo');
}
void saludoConParametro(String nombre) {
  print('Hola $nombre');
}
int obtenerNumero() {
  return 10;
}
int sumar(int a, int b) {
  return a + b;
}
int multiplicar(int a, int b) => a * b;
void saludarOpcional(String nombre, [String? apellido]) {
  if (apellido != null) {
    print('Hola $nombre $apellido');
  } else {
    print('Hola $nombre');
  }
}
void saludarOpcionalNamed(String nombre, {String? apellido}) {
  if (apellido != null) {
    print('Hola $nombre $apellido');
  } else {
    print('Hola $nombre');
  }
}
void main() {
  saludar();
  saludoConParametro('Pedro Perez');
  int numero = obtenerNumero();
  print(numero);
  print('el numero es: ${obtenerNumero()}');
  print('la suma es: ${sumar(5, 3)}');
  print('la multiplicacion es: ${multiplicar(5, 3)}');
  saludarOpcional('Juan');
  saludarOpcional('Juan', 'PÃ©rez');
  saludarOpcionalNamed('Juan');
  saludarOpcionalNamed('Juan', apellido: 'PÃ©rez');
}