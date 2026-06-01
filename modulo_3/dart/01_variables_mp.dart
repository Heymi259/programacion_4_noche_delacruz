void main() {
  var nombre = 'Carlos';
  var edad = 25;
  var peso = 75.5;
  var activo = true;

  String apellido = 'López';
  int membresia = 1001;
  double imc = 24.5;
  bool vip = false;

  final ciudad = 'Lima';

  const cuotaMensual = 49.90;
  const maxMeses = 12;

  final ahora = DateTime.now();

  print('$nombre $apellido ($edad años) - Miembro Novafit en $ciudad');

  var sesiones = 0;
  sesiones = 5;

  print('Sesiones completadas: $sesiones');

  final progreso = [20, 25, 30];
  progreso.add(35);

  print('Progreso semanal: $progreso');

  const ejercicios = ['Press banca', 'Sentadilla', 'Peso muerto'];

  String nombre2 = 'María';

  String? apellido2;
  apellido2 = 'Ramírez';

  String? ciudad2;

  print(ciudad2?.length);

  String resultado = ciudad2 ?? 'Sin sede asignada';
  print(resultado);

  ciudad2 = 'Miraflores';

  String ciudadSegura = ciudad2!;
  print(ciudadSegura);

  if (apellido2 != null) {
    print(apellido2.length);
  }

  late String horario;
  horario = 'Matutino';

  print(horario);

  print(peso);
  print(activo);
  print(membresia);
  print(imc);
  print(vip);
  print(cuotaMensual);
  print(maxMeses);
  print(ahora);
  print(nombre2);
}
