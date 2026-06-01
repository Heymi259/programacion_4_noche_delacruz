class Socio {
  final String id;
  final String nombre;
  String       horario;
  bool         _activo = false;

  Socio({
    required this.id,
    required this.nombre,
    required this.horario,
  });

  bool   get activo => _activo;
  String get estado => _activo ? 'activo' : 'inactivo';

  set estadoActivo(bool valor) {
    _activo = valor;
    print('$nombre: ${valor ? "ingresó al gym" : "salió del gym"}');
  }

  void registrarIngreso() {
    _activo = true;
    print('$nombre registró ingreso a Novafit');
  }

  void registrarSalida() {
    _activo = false;
    print('$nombre registró salida');
  }

  String resumen() => 'ID: $id | Socio: $nombre | Horario: $horario | Estado: $estado';

  @override
  String toString() => 'Socio($nombre, $horario, $estado)';
}

void main() {
  final socio = Socio(
    id:     'NFT-001',
    nombre: 'Carlos López',
    horario: 'Matutino',
  );

  socio.registrarIngreso();
  print(socio.estado);
  print(socio.resumen());
  print(socio);

  socio.estadoActivo = false;
  print(socio.activo);
}
