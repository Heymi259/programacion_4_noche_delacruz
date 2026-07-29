String construirUrl(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host$ruta:$puerto';
  }
  return 'https://$host$ruta';
}

String construirUrlV2(String host, String ruta, [int puerto = 443]) {
  return 'https://$host$ruta:$puerto';
}

void main() {
  print(construirUrl('api.ejemplo.com', '/usuarios'));
  print(construirUrl('api.ejemplo.com', '/usuarios', 8080));
  print(construirUrlV2('api.ejemplo.com', '/productos'));
}