void main() {
  for (int i = 0; i < 5; i++) {
    print('IteraciÃ³n $i');
  }
  for (int i = 0; i <= 100; i += 25) {
    print('Progreso: $i%');
  }
  for (int i = 5; i >= 1; i--) {
    print('Cuenta regresiva: $i');
  }
    final protocolos = ['HTTP', 'HTTPS', 'FTP', 'SSH', 'SMTP'];
  for (final protocolo in protocolos) {
    print(protocolo);
  }
  protocolos.forEach((p) => print(p.toLowerCase()));
  final puertos = {'HTTP': 80, 'HTTPS': 443, 'SSH': 22, 'FTP': 21};
  for (final entrada in puertos.entries) {
    print('${entrada.key} â†’ puerto ${entrada.value}');
  }
}