// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo07_layouts/widget/avatar_badge.dart';
import 'package:modulo07_layouts/widget/tarjeta_log.dart';
import 'package:modulo07_layouts/widget/fila_estado.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaLog                                 │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstado                │
// │  4  Paso 4  Stack + Positioned — AvatarBadge                   │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 4;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _paso1(),
     2 => Scaffold(
      body: ListView(
        children: [
          TarjetaLog(nivel: 'ERROR', componente: 'Press Banca',
              mensaje:   'Forma incorrecta — reducir peso',
              timestamp: DateTime.now()),
          TarjetaLog(nivel: 'WARN',  componente: 'Sentadilla',
              mensaje:   'Rodillas sobrepasan puntas de pies',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(nivel: 'INFO',  componente: 'Peso Muerto',
              mensaje:   'Serie completada con éxito',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(nivel: 'DEBUG', componente: 'Cardio',
              mensaje:   'Frecuencia cardíaca: 145 bpm',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          FilaEstado(nombre: 'Press Banca',   detalle: '85 kg · 3x12',              activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Sentadilla',    detalle: '120 kg · 3x8',              activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Dominadas',     detalle: 'peso corporal · 3x10',       activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'Peso Muerto',
                     detalle: '140 kg · 3x5', activo: true),
        ],
      ),
    ),
    4 => Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              AvatarBadge(nombre: 'Press', alertas: 2,  activo: true),
              SizedBox(height: 4),
              Text('Press Banca', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ]),
            SizedBox(width: 24),
            Column(mainAxisSize: MainAxisSize.min, children: [
            ]),
            Column(mainAxisSize: MainAxisSize.min, children: [
              AvatarBadge(nombre: 'Senta', alertas: 0,  activo: true),
              SizedBox(height: 4),
              Text('Sentadilla', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ]),
            SizedBox(width: 24),
            Column(mainAxisSize: MainAxisSize.min, children: [
              AvatarBadge(nombre: 'Domin', alertas: 0,  activo: false),
              SizedBox(height: 4),
              Text('Dominadas', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ]),
            SizedBox(width: 24),
            Column(mainAxisSize: MainAxisSize.min, children: [
              AvatarBadge(nombre: 'Peso',  alertas: 11, activo: true),
              SizedBox(height: 4),
              Text('Peso Muerto', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ]),
            SizedBox(width: 24),
            Column(mainAxisSize: MainAxisSize.min, children: [
              AvatarBadge(nombre: 'Cardio', alertas: 5,  activo: false),
              SizedBox(height: 4),
              Text('Cardio', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
            ]),
            
          ],
        ),
      ),
    ),
    5 => Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // SizedBox — espaciado fijo
          const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Primer elemento'),
          const SizedBox(height: 32),          // ← espacio fijo de 32px
          const Text('Segundo elemento (después de 32px)'),

          const Divider(height: 32),

          // Padding — espacio alrededor de un hijo
          const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            color: Colors.indigo.shade50,
            child: const Padding(
              padding: EdgeInsets.only(left: 24),    // ← sangría izquierda
              child:   Text('Texto con Padding izquierdo'),
            ),
          ),

          const Divider(height: 32),

          // Align — posicionar dentro del espacio disponible
          const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,        // ← borde derecho
            child: Icon(Icons.fitness_center, color: Colors.orange),
          ),

          const Divider(height: 32),

          // Wrap — flujo automático de elementos
          const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['Press Banca', 'Sentadilla', 'Peso Muerto', 'Dominadas', 'Cardio', 'Bíceps', 'Tríceps']
                .map((t) => Chip(label: Text(t)))
                .toList(),
          ),
        ],
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — Container (vive aquí en main.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   double.infinity,
      height:  80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(40),
        border:       Border(left: BorderSide(color: Colors.indigo, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Press Banca 85 kg',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);