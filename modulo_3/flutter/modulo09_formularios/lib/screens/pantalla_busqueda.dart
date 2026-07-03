import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';
import '../widgets/fila_servidor.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});

  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _servidores = [
    ServidorSSH(id:'1', nombre:'prod-web-01',  ip:'10.0.2.10',   puerto:22,   usuario:'deploy',   so:'Ubuntu 24.04', ssl:true,  favorito:true),
    ServidorSSH(id:'2', nombre:'prod-db-01',   ip:'10.0.2.20',   puerto:22,   usuario:'postgres', so:'Debian 12',    ssl:true),
    ServidorSSH(id:'3', nombre:'staging-api',  ip:'10.0.3.10',   puerto:2222, usuario:'ubuntu',   so:'Ubuntu 24.04', ssl:false),
    ServidorSSH(id:'4', nombre:'dev-sandbox',  ip:'192.168.1.5', puerto:22,   usuario:'vagrant',  so:'Alpine Linux', ssl:false),
    ServidorSSH(id:'5', nombre:'monitor-01',   ip:'10.0.1.100',  puerto:22,   usuario:'monitor',  so:'CentOS Stream 9', ssl:true),
    ServidorSSH(id:'6', nombre:'backup-node',  ip:'10.0.4.50',   puerto:2222, usuario:'backup',   so:'Rocky Linux 9', ssl:true),
  ];

  String _filtro = '';

  List<ServidorSSH> get _filtrados {
    if (_filtro.isEmpty) return _servidores;
    final q = _filtro.toLowerCase();
    return _servidores.where((s) =>
      s.nombre.toLowerCase().contains(q) ||
      s.ip.toLowerCase().contains(q) ||
      s.usuario.toLowerCase().contains(q) ||
      s.so.toLowerCase().contains(q)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Servidores (${filtrados.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SearchBar(
              hintText: 'Buscar servidores…',
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
                      servidor:   filtrados[i],
                      onFavorito: () => setState(() =>
                          filtrados[i].favorito = !filtrados[i].favorito),
                      onEliminar: () =>
                          setState(() => _servidores.remove(filtrados[i])),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
