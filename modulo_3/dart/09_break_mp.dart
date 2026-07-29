void main() {
  final paquetesRed = [64, 128, 512, -1, 256, 1024, -1, 32];
  print('=== Procesando con continue ===');
  for (final paquete in paquetesRed) {
    if (paquete < 0) {
      print('Paquete corrupto ignorado');
      continue;
    }
    print('Procesando paquete de $paquete bytes');
  }
  print('\n=== Procesando con break ===');
  for (final paquete in paquetesRed) {
    if (paquete < 0) {
      print('Error crÃ­tico â€” deteniendo procesamiento');
      break;
    }
    print('Procesando paquete de $paquete bytes');
  }
}