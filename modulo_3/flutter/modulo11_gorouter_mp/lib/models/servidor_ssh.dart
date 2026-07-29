// lib/models/servidor_ssh.dart
class EjercicioGym {
  final String id;
  final String nombre;
  final String peso;
  final int    repeticiones;
  final bool   completado;

  const EjercicioGym({
    required this.id,
    required this.nombre,
    required this.peso,
    required this.repeticiones,
    required this.completado,
  });
}

const ejerciciosSimulados = [
  EjercicioGym(id: '1', nombre: 'Press Banca',  peso: '85',  repeticiones: 12, completado: true),
  EjercicioGym(id: '2', nombre: 'Sentadilla',   peso: '120', repeticiones: 8,  completado: true),
  EjercicioGym(id: '3', nombre: 'Peso Muerto',  peso: '140', repeticiones: 5,  completado: false),
];