fun main() {

    println("=== NovaFit - Set ===")
    println("Inmutables")

  
    val clases = setOf(
        "CrossFit",
        "Yoga",
        "Spinning",
        "Cardio",
        "Yoga",
        "CrossFit"
    )

    println(clases)

    println("\nOperaciones de conjuntos")

    val clasesManana = setOf(
        "CrossFit",
        "Yoga",
        "Cardio"
    )

    val clasesTarde = setOf(
        "Spinning",
        "Cardio",
        "Funcional"
    )

    val clasesPremium = setOf(
        "Yoga",
        "Funcional",
        "Pilates"
    )

    println("Clases mañana: $clasesManana")
    println("Clases tarde: $clasesTarde")

    // Unión
    println("Unión: ${clasesManana union clasesTarde}")

    // Intersección
    println("Intersección: ${clasesManana intersect clasesTarde}")
    println("Intersección Premium: ${clasesPremium intersect clasesTarde}")

    // Diferencia
    println("Diferencia: ${clasesManana subtract clasesTarde}")
    println("Diferencia Premium: ${clasesTarde subtract clasesPremium}")

    println("\nSet Mutables")

    val servicios = mutableSetOf(
        "Musculación",
        "Cardio",
        "Entrenador Personal"
    )

    println(servicios)

    // No se agrega porque ya existe
    servicios.add("Cardio")
    println(servicios)

    // Agregar nuevo servicio
    servicios.add("Nutrición")
    println(servicios)

    // Eliminar servicio
    servicios.remove("Cardio")
    println(servicios)

    // Verificar existencia
    println("¿Existe Musculación? ${"Musculación" in servicios}")
    println("¿Existe Cardio? ${"Cardio" in servicios}")
}