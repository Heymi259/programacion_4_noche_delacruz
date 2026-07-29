// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import '../models/ejercicio_gym.dart';
import '../widgets/fila_servidor.dart';
import '../widgets/tarjeta_servidor_grid.dart';

class PantallaServidores extends StatefulWidget {
  const PantallaServidores({super.key});
  @override
  State<PantallaServidores> createState() => _PantallaServidoresState();
}

class _PantallaServidoresState extends State<PantallaServidores> {
  final _ejercicios = [
    EjercicioGym(id:'1', nombre:'Press Banca',  peso:'85', repeticiones:12, series:'3', grupo:'Pecho',    completado:true,  favorito:true),
    EjercicioGym(id:'2', nombre:'Sentadilla',   peso:'120', repeticiones:8,  series:'3', grupo:'Pierna',   completado:true),
    EjercicioGym(id:'3', nombre:'Peso Muerto',  peso:'140', repeticiones:5,  series:'3', grupo:'Espalda',  completado:false),
    EjercicioGym(id:'4', nombre:'Dominadas',    peso:'0',   repeticiones:10, series:'3', grupo:'Espalda',  completado:false),
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleFavorito(int i) =>
      setState(() => _ejercicios[i].favorito = !_ejercicios[i].favorito);

  void _eliminar(int i) => setState(() => _ejercicios.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Ejercicios (${_ejercicios.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _ejercicios.length,
              itemBuilder: (ctx, i) => TarjetaServidorGrid(
                servidor:   _ejercicios[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _ejercicios.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaServidor(
                ejercicios:   _ejercicios[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}