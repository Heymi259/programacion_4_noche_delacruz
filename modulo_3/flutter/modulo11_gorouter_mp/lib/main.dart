// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/auth_provider.dart';
import 'router/app_router_paso5.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Rutas básicas + context.go / push / pop             │
// │  2  Paso 2  pathParameters + pantalla de detalle                │
// │  3  Paso 3  queryParameters + extras + filtro SSL               │
// │  4  Paso 4  ShellRoute + NavigationBar persistente              │
// │  5  Paso 5  Guard redirect + login + Riverpod                   │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(const ProviderScope(child: AppGym()));

class AppGym extends ConsumerWidget {
  const AppGym({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider); // reaccionar a cambios de auth

    final router = appRouterPaso5(ref);

    return MaterialApp.router(
      title:        'Gym Tracker',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B00)),
        useMaterial3: true,
      ),
    );
  }
}