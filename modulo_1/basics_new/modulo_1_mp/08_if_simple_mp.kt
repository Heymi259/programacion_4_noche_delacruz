fun main() {

    println("=== Control de Flujo - NovaFit ===")
    println("Registro de socios")
    println("Ingrese su edad:")

    val edad = readLine()?.toIntOrNull() ?: 0

    if (edad >= 18) {
        println("Acceso autorizado al gimnasio")
    }

    if (edad >= 60) {
        println("Puede acceder a los programas especiales para adultos mayores")
    }

    println("Edad registrada: $edad años")
}