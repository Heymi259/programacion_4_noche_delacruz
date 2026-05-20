void saludar(){
  print("Hola, bienvenido a Dart!");
}
void saludoconparametro(String nombre){
  print("Hola $nombre, bienvenido a Dart!");
}

void main() {
  saludar();
  saludoconparametro("Juan");
}

void main(){
  saludar();
  saludoconparametro("Maria");
  int numero = obtenerNumero();
  print(numero);
}