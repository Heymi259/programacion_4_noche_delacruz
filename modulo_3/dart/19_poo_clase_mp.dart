class Dispositivo {
  final String id;
  final String nombre;
  String       ip;
  bool         _encendido = false;
  Dispositivo({
    required this.id,
    required this.nombre,
    required this.ip,
  });
  bool   get encendido => _encendido;
  String get estado    => _encendido ? 'activo' : 'inactivo';
  set estadoEncendido(bool valor) {
    _encendido = valor;
    print('$nombre: ${valor ? "encendido" : "apagado"}');
  }
  void conectar() {
    _encendido = true;
    print('$nombre conectado en $ip');
  }
  void desconectar() {
    _encendido = false;
    print('$nombre desconectado');
  }
  String resumen() => 'ID: $id | Nombre: $nombre | IP: $ip | Estado: $estado';
  @override
  String toString() => 'Dispositivo($nombre, $ip, $estado)';
}
void main() {
  final router = Dispositivo(
    id:     'DEV-001',
    nombre: 'router-principal',
    ip:     '192.168.1.1',
  );
  router.conectar();
  print(router.estado);
  print(router.resumen());
  print(router);
  router.estadoEncendido = false;
  print(router.encendido);
}