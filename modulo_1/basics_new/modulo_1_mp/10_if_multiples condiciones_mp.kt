fun main() {

    println("=== NovaFit ===")
    println("If con múltiples condiciones")

    println("Ingrese la cantidad de días que entrena al mes:")
    val diasEntrenamiento = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (diasEntrenamiento <= 4) {
        "Principiante"
    } else if (diasEntrenamiento <= 8) {
        "Activo"
    } else if (diasEntrenamiento <= 15) {
        "Constante"
    } else if (diasEntrenamiento <= 25) {
        "Avanzado"
    } else {
        "Atleta NovaFit"
    }

    println("Clasificación: $clasificacion")
}