// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'widgets/indicador.dart';
import 'widgets/pantalla_contexto.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                        │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 8;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => Scaffold(body: const Center(child: Saludo())),
        2 => const CatalogoBasicos(),                       // Paso 1b
        3 => Scaffold(
          body: Center(
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: const [
                Etiqueta(texto: 'Press Banca',   color: Colors.green),
                Etiqueta(texto: 'Sentadilla',   color: Colors.red,    relleno: true),
                Etiqueta(texto: 'Dominadas',    color: Colors.orange),
                Etiqueta(texto: 'Peso Muerto',  color: Colors.red,    fontSize: 16, relleno: true),
                Etiqueta(texto: 'Cardio',       color: Colors.blue,   fontSize: 11),
              ],
            ),
          ),
        ),
        4 => const Scaffold(
          body: Center(child: ServicioEstado(nombre: 'nginx-proxy')),
        ),
        5 => Scaffold(                                     // Paso 3b
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ContadorLimitado(
                  etiqueta: 'Repeticiones hoy',
                  limite:   12,
                  color:    Colors.red,
                ),
                SizedBox(height: 40),
                ContadorLimitado(
                  etiqueta: 'Series completadas',
                  limite:   8,
                  color:    Colors.orange,
                ),
              ],
            ),
          ),
        ),
        6 => Scaffold(                                     // Paso 4
          appBar: AppBar(title: const Text('Cronómetro')),
          body: const Center(child: Reloj()),
        ),
        7 => const PantallaContexto(),                    // Paso 5 — ya tiene Scaffold
        8 => Scaffold(                                     // Paso 6
          body: Center(
            child: Wrap(
              spacing: 32,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: const [
                Indicador(label: 'Press Banca',  valor: '85 kg',
                          color: Colors.green, icono: Icons.fitness_center),
                Indicador(label: 'Sentadilla',   valor: '120 kg',
                          color: Colors.red,   icono: Icons.warning_amber,
                          subtitulo: 'Nuevo récord'),
                Indicador(label: 'Cardio',       valor: '45 min',
                          color: Colors.orange),
                Indicador(label: 'Frecuencia',   valor: '72 bpm',
                          color: Colors.teal, subtitulo: 'En reposo'),
              ],
            ),
          ),
        ),
        _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
      },
    );
  }
}

// ─── Paso 1 — vive en main.dart ──────────────────────────────────────
class Saludo extends StatelessWidget {
  const Saludo({super.key});
  @override
  Widget build(BuildContext context) =>
      const Text('Hola Gym', style: TextStyle(fontSize: 32));
}