class ServidorSSH {
  final String id;
  String nombre;
  String ip;
  int puerto;
  String usuario;
  String so;
  bool ssl;
  bool favorito;

  ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    this.puerto = 22,
    this.usuario = 'root',
    this.so = 'Ubuntu 24.04',
    this.ssl = false,
    this.favorito = false,
  });
}
