import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'pantalla_paso1.dart';
import 'pantalla_paso2.dart';
import 'pantalla_paso3.dart';
import 'pantalla_paso4.dart';
import 'pantalla_paso5.dart';

// PantallaTemporal ya no se usa — puedes borrarla o dejarla

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',      builder: (_, __) => const PantallaMenu()),
    GoRoute(path: '/paso1', builder: (_, __) => const PantallaPaso1()),
    GoRoute(path: '/paso2', builder: (_, __) => const PantallaPaso2()),
    GoRoute(path: '/paso3', builder: (_, __) => const PantallaPaso3()),
    GoRoute(path: '/paso4', builder: (_, __) => const PantallaPaso4()),
    GoRoute(path: '/paso5', builder: (_, __) => const PantallaPaso5()),
  ],
);

void main() => runApp(const ProviderScope(child: AppGymApi()));

class AppGymApi extends StatelessWidget {
  const AppGymApi({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      useMaterial3: true,
    ),
  );
}

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú Principal')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _PasoInfo(
            paso: 1,
            titulo: 'Paso 1: FutureBuilder crudo',
            descripcion: 'Implementación básica de FutureBuilder',
            onTap: () => context.push('/paso1'),
          ),
          _PasoInfo(
            paso: 2,
            titulo: 'Paso 2: StateNotifier + FutureBuilder',
            descripcion: 'Manejo de estado con Riverpod',
            onTap: () => context.push('/paso2'),
          ),
          _PasoInfo(
            paso: 3,
            titulo: 'Paso 3: AsyncValue + FutureNotifier',
            descripcion: 'AsyncValue para manejo de estados',
            onTap: () => context.push('/paso3'),
          ),
          _PasoInfo(
            paso: 4,
            titulo: 'Paso 4: AsyncNotifier',
            descripcion: 'Riverpod AsyncNotifier',
            onTap: () => context.push('/paso4'),
          ),
          _PasoInfo(
            paso: 5,
            titulo: 'Paso 5: Service Locator con GetIt',
            descripcion: 'Inyección de dependencias con GetIt',
            onTap: () => context.push('/paso5'),
          ),
        ],
      ),
    );
  }
}

class _PasoInfo extends StatelessWidget {
  final int paso;
  final String titulo;
  final String descripcion;
  final VoidCallback onTap;

  const _PasoInfo({
    required this.paso,
    required this.titulo,
    required this.descripcion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(paso.toString()),
        ),
        title: Text(titulo),
        subtitle: Text(descripcion),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}