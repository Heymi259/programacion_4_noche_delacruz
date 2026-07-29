class EjercicioGym {
  final String id;
  final String nombre;
  final String peso;
  final int    repeticiones;
  final bool   completado;
  bool         favorito;

  EjercicioGym({
    required this.id,
    required this.nombre,
    required this.peso,
    required this.repeticiones,
    required this.completado,
    this.favorito = false,
  });
}
