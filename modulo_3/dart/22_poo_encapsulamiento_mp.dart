class SocioNovafit {
  String _nombre;
  double _peso;
  int _edad;
  String _plan;
  bool _activo;

  SocioNovafit(this._nombre, this._peso, this._edad, this._plan, this._activo);

  String get nombre => _nombre;
  double get peso => _peso;
  int get edad => _edad;
  String get plan => _plan;
  bool get activo => _activo;

  set nombre(String nombre) {
    if (nombre.length >= 3) {
      _nombre = nombre;
    } else {
      print('El nombre debe tener al menos 3 caracteres');
    }
  }

  set peso(double peso) {
    if (peso > 0 && peso < 300) {
      _peso = peso;
    } else {
      print('Peso no válido');
    }
  }

  set plan(String plan) {
    final planesValidos = ['Básico', 'Estándar', 'Premium', 'VIP'];
    if (planesValidos.contains(plan)) {
      _plan = plan;
    } else {
      print('Plan no válido. Opciones: ${planesValidos.join(", ")}');
    }
  }

  double get imc {
    return _peso / (1.75 * 1.75);
  }

  bool get puedeEntrenar => _activo;

  void activarMembresia() {
    _activo = true;
    print('Membresía activada para $_nombre');
  }

  void desactivarMembresia() {
    _activo = false;
    print('Membresía desactivada para $_nombre');
  }
}

void main() {
  final socio = SocioNovafit('Carlos López', 75.0, 25, 'Premium', true);

  print('Nombre: ${socio.nombre}');
  print('Peso: ${socio.peso} kg');
  print('Plan: ${socio.plan}');

  socio.peso = 78.5;
  print('Nuevo peso: ${socio.peso} kg');

  socio.plan = 'VIP';
  print('Nuevo plan: ${socio.plan}');

  socio.plan = 'Gratuito';

  print('IMC: ${socio.imc.toStringAsFixed(2)}');
  print('¿Puede entrenar? ${socio.puedeEntrenar}');

  socio.desactivarMembresia();
  print('¿Puede entrenar? ${socio.puedeEntrenar}');

  socio.activarMembresia();
}
