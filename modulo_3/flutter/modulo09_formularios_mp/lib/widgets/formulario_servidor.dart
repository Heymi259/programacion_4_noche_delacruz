import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlNombre  = TextEditingController();
  final _ctrlPeso    = TextEditingController();
  final _ctrlReps    = TextEditingController(text: '12');
  final _ctrlSeries  = TextEditingController(text: '3');

  final _focusPeso  = FocusNode();
  final _focusReps  = FocusNode();
  final _focusSeries = FocusNode();

  String _grupo  = 'Pecho';
  bool   _completado = false;

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlPeso.dispose();
    _ctrlReps.dispose();
    _ctrlSeries.dispose();
    _focusPeso.dispose();
    _focusReps.dispose();
    _focusSeries.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    widget.onGuardar({
      'nombre':  _ctrlNombre.text,
      'ip':      _ctrlPeso.text,
      'puerto':  _ctrlReps.text,
      'usuario': _ctrlSeries.text,
      'so':      _grupo,
      'ssl':     _completado.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller:      _ctrlNombre,
            decoration:      const InputDecoration(
              labelText:  'Nombre del ejercicio',
              hintText:   'Press Banca',
              prefixIcon: Icon(Icons.fitness_center),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPeso.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 2)                  return 'Mínimo 2 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
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
            onFieldSubmitted: (_) => _focusReps.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El peso es obligatorio';
              if (int.tryParse(v) == null) return 'Ingresa un número válido';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlReps,
            focusNode:       _focusReps,
            decoration:      const InputDecoration(
              labelText:  'Repeticiones',
              prefixIcon: Icon(Icons.repeat),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusSeries.requestFocus(),
            validator: (v) {
              final reps = int.tryParse(v ?? '');
              if (reps == null)              return 'Debe ser un número';
              if (reps < 1 || reps > 100) return 'Entre 1 y 100';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlSeries,
            focusNode:       _focusSeries,
            decoration:      const InputDecoration(
              labelText:  'Series',
              prefixIcon: Icon(Icons.format_list_numbered),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'Las series son obligatorias' : null,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _grupo,
            decoration: const InputDecoration(
              labelText:  'Grupo muscular',
              prefixIcon: Icon(Icons.accessibility_new),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Pecho', 'Espalda', 'Pierna', 'Hombro', 'Brazo',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _grupo = v!),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title:     const Text('Completado'),
            subtitle:  const Text('Marcar como terminado'),
            value:     _completado,
            onChanged: (v) => setState(() => _completado = v),
            secondary: const Icon(Icons.check_circle),
          ),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar ejercicio'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
