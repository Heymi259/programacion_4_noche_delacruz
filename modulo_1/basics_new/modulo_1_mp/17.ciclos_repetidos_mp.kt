fun main() {

    println("=== NovaFit - Ciclo Repeat ===")

    println("¿Cuántas sesiones de entrenamiento desea registrar?")
    val sesiones = readLine()?.toIntOrNull() ?: 3

    var totalHoras = 0

    repeat(sesiones) { i ->

        println("Horas entrenadas en la sesión ${i + 1}:")
        val horas = readLine()?.toIntOrNull() ?: 0

        totalHoras += horas
    }

    val promedio = totalHoras / sesiones

    println("Promedio de horas entrenadas: $promedio")

    println(
        "Nivel de actividad: ${
            when {
                promedio < 2 -> "Bajo"
                promedio <= 4 -> "Moderado"
                else -> "Alto"
            }
        }"
    )
}