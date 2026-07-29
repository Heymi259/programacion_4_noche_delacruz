import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ejercicio_gym.dart' show EjercicioGym;

class EjerciciosNotifier extends Notifier<List<EjercicioGym>> {
  @override
  List<EjercicioGym> build() => [
    EjercicioGym(id:'1', nombre:'Press Banca',  peso:'85', repeticiones:12, completado:true,  favorito:true),
    EjercicioGym(id:'2', nombre:'Sentadilla',   peso:'120', repeticiones:8,  completado:true),
    EjercicioGym(id:'3', nombre:'Peso Muerto',  peso:'140', repeticiones:5,  completado:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? EjercicioGym(id:s.id, nombre:s.nombre, peso:s.peso,
                        repeticiones:s.repeticiones, completado:s.completado,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(EjercicioGym ejercicio) {
    state = [...state, ejercicio];
  }
}

final ejerciciosProvider =
    NotifierProvider<EjerciciosNotifier, List<EjercicioGym>>(
  EjerciciosNotifier.new,
);
