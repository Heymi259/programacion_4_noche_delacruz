fun main() {

    println("=== NovaFit - Listas ===")

    println("Listas Inmutables")

    
    val entrenamientos = listOf(
        "Musculación",
        "Cardio",
        "CrossFit",
        "Yoga",
        "Spinning"
    )

    println(entrenamientos)
    println("Cantidad: ${entrenamientos.size}")

    println("Primer entrenamiento: ${entrenamientos[0]}")
    println("Primer elemento: ${entrenamientos.first()}")
    println("Último elemento: ${entrenamientos.last()}")

    println("Elemento índice 2: ${entrenamientos.get(2)}")
    println("Índice de Cardio: ${entrenamientos.indexOf("Cardio")}")

    println("¿Existe Spinning?: ${entrenamientos.contains("Spinning")}")
    println("¿Existe Boxeo?: ${"Boxeo" in entrenamientos}")

    println("Sublista: ${entrenamientos.subList(1, 4)}")
    println("Primeros 2: ${entrenamientos.take(2)}")
    println("Omitir primeros 3: ${entrenamientos.drop(3)}")
    println("Últimos 2: ${entrenamientos.takeLast(2)}")

    println("\nListas Mutables")

    val membresias = mutableListOf(
        "Básica",
        "Premium",
        "VIP",
        "Estudiantil"
    )

    println(membresias)

    // Agregar
    membresias.add("Corporativa")
    println(membresias)

    // Insertar
    membresias.add(1, "Familiar")
    println(membresias)

    // Eliminar
    membresias.remove("Corporativa")
    println(membresias)

    // Modificar
    membresias[1] = "Empresarial"
    println(membresias)

    println("\nArrayDeque")

    val socios = ArrayDeque<Int>()

    println(socios)

    socios.addFirst(1001)
    println(socios)

    socios.addFirst(1002)
    println(socios)

    socios.addLast(1003)
    println(socios)

    socios.removeFirst()
    println(socios)

    socios.removeLast()
    println(socios)
}