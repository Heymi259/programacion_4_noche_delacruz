class EjercicioGym {
  final String id;
  String nombre;
  String peso;
  int repeticiones;
  String series;
  String grupo;
  bool completado;
  bool favorito;

  EjercicioGym({
    required this.id,
    required this.nombre,
    required this.peso,
    this.repeticiones = 12,
    this.series = '3',
    this.grupo = 'Pecho',
    this.completado = false,
    this.favorito = false,
  });
}
