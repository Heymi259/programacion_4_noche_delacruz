fun main() {

    println("=== Registro de Socios NovaFit ===")

    println("Ingrese su nombre:")
    val nombre = readLine()

    println("Bienvenido(a) a NovaFit, $nombre")

    println("Ingrese su edad:")
    val edad = readLine()?.toIntOrNull() ?: 0

    println("Su edad es: $edad años")

    val edadEn5Anios = edad + 5

    println("Dentro de 5 años tendrá: $edadEn5Anios años")
    println("Edad calculada: ${edad + 5} años")
}