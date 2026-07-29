class Servidor {
  final String hostname;
  final String ip;
  final int    puerto;
  final bool   usaSsl;
  Servidor({
    required this.hostname,
    required this.ip,
    required this.puerto,
    this.usaSsl = false,
  });
  Servidor.local()
      : hostname = 'localhost',
        ip       = '127.0.0.1',
        puerto   = 8080,
        usaSsl   = false;
  Servidor.produccion({required this.hostname, required this.ip})
      : puerto  = 443,
        usaSsl  = true;
  factory Servidor.desdeUrl(String url) {
    final uri = Uri.parse(url);
    return Servidor(
      hostname: uri.host,
      ip:       uri.host,
      puerto:   uri.port != 0 ? uri.port : (uri.scheme == 'https' ? 443 : 80),
      usaSsl:   uri.scheme == 'https',
    );
  }
  @override
  String toString() =>
      '${usaSsl ? "https" : "http"}://$hostname:$puerto';
}

void main() {
  final s1 = Servidor(hostname: 'api.mi-app.com', ip: '10.0.1.5', puerto: 3000);
  final s2 = Servidor.local();
  final s3 = Servidor.produccion(hostname: 'api.mi-app.com', ip: '10.0.1.5');
  final s4 = Servidor.desdeUrl('https://api.mi-app.com');
  print(s1);
  print(s2);
  print(s3);
  print(s4);
}