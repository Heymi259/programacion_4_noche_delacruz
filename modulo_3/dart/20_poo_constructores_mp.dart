class Membresia {
  final String socio;
  final String plan;
  final int    duracionMeses;
  final bool   incluyePersonalTrainer;

  Membresia({
    required this.socio,
    required this.plan,
    required this.duracionMeses,
    this.incluyePersonalTrainer = false,
  });

  Membresia.basico({required this.socio})
      : plan = 'Básico',
        duracionMeses = 1,
        incluyePersonalTrainer = false;

  Membresia.premium({required this.socio})
      : plan = 'Premium',
        duracionMeses = 12,
        incluyePersonalTrainer = true;

  factory Membresia.desdeCodigo(String codigo) {
    if (codigo.startsWith('VIP')) {
      return Membresia(
        socio: codigo.replaceAll('VIP-', ''),
        plan: 'VIP',
        duracionMeses: 24,
        incluyePersonalTrainer: true,
      );
    }
    return Membresia(
      socio: codigo,
      plan: 'Estándar',
      duracionMeses: 3,
    );
  }

  @override
  String toString() =>
      '$socio — Plan $plan (${duracionMeses}meses)${incluyePersonalTrainer ? " + PT" : ""}';
}

void main() {
  final m1 = Membresia(socio: 'Ana Torres', plan: 'Premium', duracionMeses: 6);
  final m2 = Membresia.basico(socio: 'Luis Rojas');
  final m3 = Membresia.premium(socio: 'María Díaz');
  final m4 = Membresia.desdeCodigo('VIP-CarlosL');

  print(m1);
  print(m2);
  print(m3);
  print(m4);
}
