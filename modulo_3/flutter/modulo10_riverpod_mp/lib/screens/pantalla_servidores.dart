import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ejercicio_gym.dart';
import '../providers/servidores_provider.dart';

class PantallaServidores extends ConsumerWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ejercicios = ref.watch(ejerciciosProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Ejercicios (${ejercicios.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ejercicios.isEmpty
          ? const Center(child: Text('Sin ejercicios'))
          : ListView.separated(
              itemCount:        ejercicios.length,
              separatorBuilder: (_, _) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = ejercicios[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.completado
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.fitness_center,
                        color: s.completado ? Colors.green : Colors.grey),
                  ),
                  title:    Text(s.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${s.peso} kg · 3x${s.repeticiones}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(ejerciciosProvider.notifier)
                            .toggleFavorito(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(ejerciciosProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(ejerciciosProvider.notifier).agregar(
            EjercicioGym(
              id:     id,
              nombre: 'nuevo-ej-$id',
              peso:     '50',
              repeticiones: 10,
              completado:    true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
