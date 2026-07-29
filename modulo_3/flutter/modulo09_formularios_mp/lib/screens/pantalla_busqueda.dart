import 'package:flutter/material.dart';
import '../models/ejercicio_gym.dart';
import '../widgets/fila_servidor.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});

  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _ejercicios = [
    EjercicioGym(id:'1', nombre:'Press Banca',  peso:'85', repeticiones:12, series:'3', grupo:'Pecho',    completado:true,  favorito:true),
    EjercicioGym(id:'2', nombre:'Sentadilla',   peso:'120', repeticiones:8,  series:'3', grupo:'Pierna',   completado:true),
    EjercicioGym(id:'3', nombre:'Peso Muerto',  peso:'140', repeticiones:5,  series:'3', grupo:'Espalda',  completado:false),
    EjercicioGym(id:'4', nombre:'Dominadas',    peso:'0',   repeticiones:10, series:'3', grupo:'Espalda',  completado:false),
    EjercicioGym(id:'5', nombre:'Press Militar',peso:'35',  repeticiones:10, series:'4', grupo:'Hombro',  completado:true),
    EjercicioGym(id:'6', nombre:'Curl Bíceps',  peso:'25',  repeticiones:12, series:'3', grupo:'Brazo',   completado:false),
  ];

  String _filtro = '';

  List<EjercicioGym> get _filtrados {
    if (_filtro.isEmpty) return _ejercicios;
    final q = _filtro.toLowerCase();
    return _ejercicios.where((s) =>
      s.nombre.toLowerCase().contains(q) ||
      s.peso.contains(q) ||
      s.grupo.toLowerCase().contains(q)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Ejercicios (${filtrados.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SearchBar(
              hintText: 'Buscar ejercicios…',
              leading: const Icon(Icons.search),
              trailing: [
                if (_filtro.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => setState(() => _filtro = ''),
                  ),
              ],
              onChanged: (v) => setState(() => _filtro = v),
            ),
          ),
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off, size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text('Sin resultados',
                            style: TextStyle(color: cs.onSurfaceVariant)),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemCount:        filtrados.length,
                    separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
                    itemBuilder: (ctx, i) => FilaServidor(
                      ejercicios:   filtrados[i],
                      onFavorito: () => setState(() =>
                          filtrados[i].favorito = !filtrados[i].favorito),
                      onEliminar: () =>
                          setState(() => _ejercicios.remove(filtrados[i])),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
