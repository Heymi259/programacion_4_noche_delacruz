// lib/screens/pantalla_navegacion.dart
import 'package:flutter/material.dart';

class PantallaNavegacion extends StatefulWidget {
  const PantallaNavegacion({super.key});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Gym Tracker'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaDashboard(),
          _PantallaEjercicios(),
          _PantallaRutina(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.primaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Resumen',
          ),
          NavigationDestination(
            icon:         Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label:        'Ejercicios',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.notifications)),
            label:        'Rutina',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Ajustes',
          ),
        ],
      ),
    );
  }
}

// ─── Pantallas de cada pestaña ────────────────────────────────────────────

class _PantallaDashboard extends StatelessWidget {
  const _PantallaDashboard();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen', style: text.headlineSmall),
        const SizedBox(height: 16),
        // Tarjetas de métricas
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Ejercicios', valor: '8',  icono: Icons.fitness_center, color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Series',     valor: '24', icono: Icons.repeat,         color: cs.errorContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Peso máx', valor: '140 kg', icono: Icons.trending_up, color: cs.tertiaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Cardio',   valor: '30 min', icono: Icons.timer,        color: cs.secondaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaEjercicios extends StatelessWidget {
  const _PantallaEjercicios();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final ejercicios = ['Press Banca','Sentadilla','Peso Muerto','Dominadas','Bíceps','Remo'];
    final pesos = ['85 kg','120 kg','140 kg','10 reps','25 kg','60 kg'];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading:  Icon(Icons.fitness_center, color: cs.primary),
          title:    Text(ejercicios[i]),
          subtitle: Text('${pesos[i]} · 3x12'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          onTap: () {},
        ),
      ),
    );
  }
}

class _PantallaRutina extends StatelessWidget {
  const _PantallaRutina();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const rutina = [
      (ejercicio: 'Press Banca',  detalle: '3x12 a 85 kg',     estado: 'COMPLETADO'),
      (ejercicio: 'Sentadilla',   detalle: '3x8 a 120 kg',     estado: 'PENDIENTE'),
      (ejercicio: 'Peso Muerto',  detalle: '3x5 a 140 kg',     estado: 'PENDIENTE'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: rutina.length,
      itemBuilder: (ctx, i) {
        final item = rutina[i];
        final esCompletado = item.estado == 'COMPLETADO';

        return Card(
          color: esCompletado ? cs.tertiaryContainer : cs.errorContainer,
          child: ListTile(
            leading: Icon(
              esCompletado ? Icons.check_circle : Icons.schedule,
              color: esCompletado ? cs.onTertiaryContainer : cs.onErrorContainer,
            ),
            title: Text(item.ejercicio,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(item.detalle),
            trailing: Chip(
              label: Text(item.estado, style: const TextStyle(fontSize: 11)),
              backgroundColor: esCompletado ? cs.tertiary : cs.error,
              labelStyle: TextStyle(
                color: esCompletado ? cs.onTertiary : cs.onError,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title:   Text('Seguridad'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Acerca de'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
