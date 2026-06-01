void main() {
  final nombre = 'Carlos';
  final peso   = 75;

  print('Bienvenido a Novafit, $nombre');

  print('${nombre.toUpperCase()} levantó ${peso + 5} kg hoy');

  final ficha = '''
Socio: $nombre
Peso:  $peso kg
Meta:  ${peso >= 80 ? 'Mantener' : 'Subir masa'}
  ''';
  print(ficha);

  final ruta = r'C:\Novafit\Socios\2025';

  final saludo = 'Hola, ' + nombre + '!';

  print('novafit'.toUpperCase());
  print('  Novafit  '.trim());
  print('Novafit'.contains('fit'));
  print('Novafit'.replaceAll('fit', 'GYM'));
  print('peso,rep,sets'.split(','));
  print('Novafit'.substring(0, 4));
  print('Press Banca'.startsWith('Press'));
  print('kg'.padLeft(5, '0'));
}
