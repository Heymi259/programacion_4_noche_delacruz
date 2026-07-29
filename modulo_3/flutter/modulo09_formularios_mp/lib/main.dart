// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/formulario_servidor.dart';
import 'models/ejercicio_gym.dart';
import 'widgets/fila_servidor.dart';
import 'screens/pantalla_servidores.dart';
import 'widgets/tarjeta_servidor_grid.dart';
import 'screens/pantalla_busqueda.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  TextField + TextEditingController + FocusNode       │
// │  2  Paso 2  Form + TextFormField + validación                   │
// │  3  Paso 3  Modelo + ListView.builder + ListTile acciones       │
// │  4  Paso 4  GridView.builder + toggle lista/grid                │
// │  5  Paso 5  SearchBar + filtrado en tiempo real                 │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => Builder(builder: (ctx) => Scaffold(
      appBar: AppBar(title: const Text('Nuevo ejercicio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioServidor(
          onGuardar: (datos) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                content: Text('Ejercicio "${datos['nombre']}" guardado'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    )),
    3 => const _Paso3(),
    4 => const PantallaServidores(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — vive en main.dart ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlNombre = TextEditingController();
  final _ctrlPeso   = TextEditingController();
  final _ctrlReps   = TextEditingController(text: '12');
  final _focusPeso  = FocusNode();
  final _focusReps  = FocusNode();

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlPeso.dispose();
    _ctrlReps.dispose();
    _focusPeso.dispose();
    _focusReps.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo ejercicio'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlNombre,
              decoration:      const InputDecoration(
                labelText:  'Ejercicio',
                hintText:   'Press Banca',
                prefixIcon: Icon(Icons.fitness_center),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusPeso.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlPeso,
              focusNode:       _focusPeso,
              decoration:      const InputDecoration(
                labelText:  'Peso (kg)',
                hintText:   '85',
                prefixIcon: Icon(Icons.monitor_weight),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusReps.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlReps,
              focusNode:   _focusReps,
              decoration:  const InputDecoration(
                labelText:  'Repeticiones',
                prefixIcon: Icon(Icons.repeat),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${_ctrlNombre.text} — ${_ctrlPeso.text} kg x ${_ctrlReps.text} reps',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.fitness_center),
              label: const Text('Agregar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombre.clear();
                _ctrlPeso.clear();
                _ctrlReps.text = '12';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
      );
    }
  }

// ─── Paso 3 — vive en main.dart ────────────────────────────────────────
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _ejercicios = [
    EjercicioGym(id:'1', nombre:'Press Banca',  peso:'85', repeticiones:12, series:'3', grupo:'Pecho',    completado:true,  favorito:true),
    EjercicioGym(id:'2', nombre:'Sentadilla',   peso:'120', repeticiones:8,  series:'3', grupo:'Pierna',   completado:true),
    EjercicioGym(id:'3', nombre:'Peso Muerto',  peso:'140', repeticiones:5,  series:'3', grupo:'Espalda',  completado:false),
    EjercicioGym(id:'4', nombre:'Dominadas',    peso:'0',   repeticiones:10, series:'3', grupo:'Espalda',  completado:false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Ejercicios (${_ejercicios.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _ejercicios.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.fitness_center_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin ejercicios',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _ejercicios.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                ejercicios:   _ejercicios[i],
                onFavorito: () => setState(() =>
                    _ejercicios[i].favorito = !_ejercicios[i].favorito),
                onEliminar: () => setState(() => _ejercicios.removeAt(i)),
              ),
            ),
    );
  }
}