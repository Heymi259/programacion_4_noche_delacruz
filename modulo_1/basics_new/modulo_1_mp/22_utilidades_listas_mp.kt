fun main() {

    println("=== NovaFit - Utilidades de Listas ===")

    val horasEntrenamiento = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

    println("Horas registradas:")
    println(horasEntrenamiento)

    println("\nMAP")

    // Multiplicar horas por calorías aproximadas (100 por hora)
    val caloriasQuemadas = horasEntrenamiento.map { it * 100 }
    println(caloriasQuemadas)

    // Convertir a texto
    val sesiones = horasEntrenamiento.map { "Sesion $it" }
    println(sesiones)

    println("\nFILTER")

    // Entrenamientos pares
    val sesionesPares = horasEntrenamiento.filter { it % 2 == 0 }
    println(sesionesPares)

    // Más de 5 horas
    val entrenamientosIntensos = horasEntrenamiento.filter { it > 5 }
    println(entrenamientosIntensos)

    // Combinación de condiciones
    val sesionesParesIntensas =
        horasEntrenamiento.filter { it % 2 == 0 && it > 5 }

    println(sesionesParesIntensas)

    // FilterNot
    val sesionesImpares =
        horasEntrenamiento.filterNot { it % 2 == 0 }

    println(sesionesImpares)
}