void main() {
  String plan = 'Premium';

  switch (plan) {
    case 'Básico':
      print('Acceso a sala de pesas');
    case 'Estándar':
      print('Sala de pesas + clases grupales');
    case 'Premium':
      print('Todo incluido + sauna');
    case 'VIP':
      print('Acceso 24h + entrenador personal');
    case 'Familiar':
      print('Plan para 4 miembros');
    default:
      print('Plan no válido');
  }

  plan = 'Premium';

  String descripcion = switch (plan) {
    'Básico'    => 'S/ 39.90 — pesas básicas',
    'Estándar'  => 'S/ 59.90 — incluye clases',
    'Premium'   => 'S/ 89.90 — acceso completo',
    'VIP'       => 'S/ 149.90 — experiencia total',
    'Familiar'  => 'S/ 199.90 — 4 miembros',
    _           => 'Plan desconocido',
  };

  print(descripcion);

    int duracionMeses = 12;

  String categoria = switch (duracionMeses) {
    1 || 2 || 3           => 'Corto plazo',
    6 || 7 || 8 || 9      => 'Medio plazo',
    12 || 18 || 24        => 'Largo plazo',
    _                     => 'Personalizado',
  };

  print(categoria);

  double peso = 140;

  String categoriaPeso = switch (peso) {
    double p when p >= 200 => '🏋️ PESADO — avanzado',
    double p when p >= 120 => '💪 INTERMEDIO — buen ritmo',
    double p when p >= 60  => '🔰 PRINCIPIANTE — sigue así',
    double p when p >= 20  => '🟢 CALENTAMIENTO',
    _                      => '🔵 SIN PESO',
  };

  print(categoriaPeso);

    Object respuestaApi = {'id': 1, 'nombre': 'Press Banca', 'peso': 80};

  String resultado = switch (respuestaApi) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error: ${m['error']}',
    Map<String, dynamic> m =>
        'Ejercicio: ${m['nombre']} — ${m['peso']} kg',
    List<dynamic> lista =>
        '${lista.length} ejercicios en la rutina',
    String texto =>
        'Texto recibido: $texto',
    _ =>
        'Respuesta desconocida',
  };

  print(resultado);
}
