fun main() {

    println("=== NovaFit ===")
    println("Condicional When")
    println("Seleccione un tipo de entrenamiento (1-7)")
    println("1 -> Musculación")
    println("2 -> Cardio")
    println("3 -> CrossFit")
    println("4 -> Yoga")
    println("5 -> Spinning")
    println("6 -> Entrenamiento Funcional")
    println("7 -> Personal Training")

    val codigo = readLine()?.toIntOrNull() ?: 0

    val entrenamiento = when (codigo) {
        1 -> "Musculación"
        2 -> "Cardio"
        3 -> "CrossFit"
        4 -> "Yoga"
        5 -> "Spinning"
        6 -> "Entrenamiento Funcional"
        7 -> "Personal Training"
        else -> "Entrenamiento no disponible"
    }

    println("Entrenamiento seleccionado: $entrenamiento")
}