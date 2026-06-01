fun main() {

    println("=== NovaFit ===")
    println("When con bloques de código")

    println("Nombre del socio:")
    val socio = readLine()?.trim() ?: ""

    println("Nivel de membresía (VIP/PREMIUM/BASICA/PRUEBA):")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {

        "VIP" -> {
            println("SOCIO VIP: $socio")
            println("Acceso ilimitado a todas las áreas")
            println("Asignar entrenador personal")
        }

        "PREMIUM" -> {
            println("SOCIO PREMIUM: $socio")
            println("Acceso a clases grupales")
            println("Registrar beneficios Premium")
        }

        "BASICA" ->
            println("SOCIO BÁSICO: $socio, acceso a área de musculación")

        "PRUEBA" ->
            println("SOCIO EN PERÍODO DE PRUEBA: $socio, acceso limitado")

        else ->
            println("Tipo de membresía no reconocido")
    }

    println("\nEdad del socio:")
    val edad = readLine()?.toIntOrNull() ?: 0

    val categoria = when (edad) {
        in 0..12 -> "Infantil"
        in 13..17 -> "Juvenil"
        in 18..35 -> "Joven Adulto"
        in 36..59 -> "Adulto"
        else -> "Adulto Mayor"
    }

    println("$edad años -> Categoría: $categoria")
}