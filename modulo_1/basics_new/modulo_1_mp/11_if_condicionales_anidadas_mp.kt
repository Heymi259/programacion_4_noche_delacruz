fun main() {

    println("=== NovaFit ===")
    println("If con múltiples condiciones anidadas")

    println("¿El socio tiene membresía Premium? (s/n)")
    val tienePremium = readLine()?.trim()?.lowercase() == "s"

    println("Ingrese la cantidad de entrenamientos realizados este mes:")
    val entrenamientos = readLine()?.toIntOrNull() ?: 0

    if (tienePremium) {
        println("Socio Premium")
    } else if (entrenamientos > 20) {
        println("Nivel de actividad muy alto")
    } else {
        println("Socio con membresía estándar")

        if (entrenamientos < 8 || entrenamientos > 30) {
            println("Frecuencia de entrenamiento fuera del rango recomendado")
        } else {
            println("Frecuencia de entrenamiento adecuada")
        }
    }
}