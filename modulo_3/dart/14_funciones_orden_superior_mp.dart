void main() {
  final precios = [29.99, 49.50, 15.00, 99.99];
  final preciosConIva = precios.map((p) => p * 1.15);
  print(preciosConIva.toList());
  final endpoints = ['/usuarios', '/productos', '/pedidos'];
  final urls = endpoints.map((e) => 'https://api.ejemplo.com$e');
  print(urls.toList());
}