import 'package:flutter/material.dart';
import '../models/ejercicio_gym.dart';

class FilaServidor extends StatelessWidget {
  final EjercicioGym ejercicios;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaServidor({
    super.key,
    required this.ejercicios,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        child: Text(ejercicios.nombre[0].toUpperCase()),
      ),
      title: Text(ejercicios.nombre),
      subtitle: Text('${ejercicios.peso} kg · ${ejercicios.series}x${ejercicios.repeticiones}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              ejercicios.favorito ? Icons.star : Icons.star_border,
              color: ejercicios.favorito ? Colors.amber : null,
            ),
            onPressed: onFavorito,
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: cs.error),
            onPressed: onEliminar,
          ),
        ],
      ),
    );
  }
}
