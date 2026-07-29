void main() {
  String codigoHttp = '404';
  switch (codigoHttp) {
    case '200':
      print('OK');
    case '201':
      print('Creado');
    case '400':
      print('PeticiÃ³n incorrecta');
    case '401':
      print('No autorizado');
    case '404':
      print('No encontrado');
    case '500':
      print('Error del servidor');
    default:
      print('CÃ³digo desconocido');
  }
  codigoHttp = '200';
  String descripcion = switch (codigoHttp) {
    '200' => 'OK â€” solicitud exitosa',
    '201' => 'Created â€” recurso creado',
    '204' => 'No Content â€” sin contenido',
    '400' => 'Bad Request â€” datos invÃ¡lidos',
    '401' => 'Unauthorized â€” sin autenticaciÃ³n',
    '403' => 'Forbidden â€” sin permiso',
    '404' => 'Not Found â€” recurso no existe',
    '500' => 'Internal Server Error',
    '503' => 'Service Unavailable',
    _     => 'CÃ³digo HTTP desconocido',
  };
  print(descripcion);
    int codigoNumerico = 404;
  String categoria = switch (codigoNumerico) {
    200 || 201 || 204       => 'Ã‰xito (2xx)',
    301 || 302 || 307       => 'RedirecciÃ³n (3xx)',
    400 || 401 || 403 || 404 => 'Error del cliente (4xx)',
    500 || 502 || 503       => 'Error del servidor (5xx)',
    _                       => 'Desconocido',
  };
  print(categoria);
  double temperatura = 39.2;
  String alerta = switch (temperatura) {
    double t when t >= 40.0 => 'ðŸš¨ CRÃTICO â€” llame a emergencias',
    double t when t >= 38.5 => 'ðŸ”´ FIEBRE ALTA â€” consulte mÃ©dico',
    double t when t >= 37.5 => 'ðŸŸ¡ FIEBRE LEVE â€” descanse',
    double t when t >= 36.0 => 'ðŸŸ¢ NORMAL',
    _                       => 'ðŸ”µ HIPOTERMIA â€” abrÃ­gese',
  };
  print(alerta);
  Object respuestaApi = {'id': 1, 'nombre': 'Teclado', 'precio': 89.99};
  String resultado = switch (respuestaApi) {
    Map<String, dynamic> m when m.containsKey('error') =>
        'Error: ${m['error']}',
    Map<String, dynamic> m =>
        'Producto: ${m['nombre']} â€” \$${m['precio']}',
    List<dynamic> lista =>
        '${lista.length} elementos en la lista',
    String texto =>
        'Texto recibido: $texto',
    _ =>
        'Respuesta desconocida',
  };
  print(resultado);
}