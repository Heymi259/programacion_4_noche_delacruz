// lib/screens/pantalla_appbar.dart
import 'package:flutter/material.dart';

class PantallaAppBar extends StatelessWidget {
  const PantallaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar — colapsa al hacer scroll
          SliverAppBar.medium(
          title:           const Text('Ejercicios'),
          pinned:          false,
          backgroundColor: cs.tertiaryContainer,
          foregroundColor: cs.onPrimaryContainer,
          actions: [
            IconButton(
              icon:      const Icon(Icons.filter_list),
              onPressed: () {},
              tooltip:   'Filtrar',
            ),
            IconButton(
              icon:      const Icon(Icons.search),
              onPressed: () {},
              tooltip:   'Buscar',
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: cs.primaryContainer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 56),
                  Icon(Icons.fitness_center, size: 48, color: cs.onPrimaryContainer),
                  const SizedBox(height: 8),
                  Text(
                    '8 ejercicios hoy',
                    style: TextStyle(color: cs.onPrimaryContainer),
                  ),
                ],
              ),
            ),
          ),
          ),

          // Lista de servidores
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  child: ListTile(
                    leading:  Icon(Icons.fitness_center, color: cs.primary),
                    title:    Text(['Press Banca','Sentadilla','Peso Muerto','Dominadas','Bíceps','Tríceps','Hombro','Femoral','Pantorrilla','Cardio'][i]),
                    subtitle: Text(['85 kg','120 kg','140 kg','10 reps','25 kg','20 kg','35 kg','60 kg','40 kg','30 min'][i] + ' · ${['3x12','3x8','3x5','3x10','3x12','3x10','3x10','3x12','3x15','1'][i]}'),
                    trailing: Chip(
                      label:           const Text('OK'),
                      backgroundColor: cs.primaryContainer,
                      labelStyle:      TextStyle(color: cs.onPrimaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
