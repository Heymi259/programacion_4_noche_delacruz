void main() {
  int repeticiones = 0;
  int energia      = 100;

  while (energia > 0 && repeticiones < 12) {
    repeticiones++;
    energia -= 8;
    print('Rep $repeticiones — energía restante: $energia');
  }

  int intentos = 0;
  bool marcaSuperada = false;

  do {
    intentos++;
    print('Intento de PR #$intentos...');
    if (intentos == 3) marcaSuperada = true;
  } while (!marcaSuperada && intentos < 5);

  print(marcaSuperada
      ? '¡Nuevo récord personal tras $intentos intentos!'
      : 'No se superó la marca');
}
