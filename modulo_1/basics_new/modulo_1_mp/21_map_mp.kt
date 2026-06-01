fun main() {

    println("=== NovaFit - Map ===")
    println("Inmutables")

    // Membresía -> Precio mensual
    val membresias = mapOf(
        "Basica" to 25,
        "Premium" to 40,
        "VIP" to 60,
        "Estudiantil" to 20
    )

    // Acceso a valores
    println(membresias["Premium"])
    println(membresias["Corporativa"])

    // Evitar valores nulos
    println(membresias.getOrDefault("VIP", 0))
    println(membresias.getOrDefault("Corporativa", 0))

    // Propiedades del mapa
    println(membresias.keys)
    println(membresias.values)
    println(membresias.entries)

    println(membresias)

    // Recorrer mapa
    for ((plan, precio) in membresias) {
        println("Plan: $plan - Precio: $$precio")
    }

    // Recorrer entradas
    for (membresia in membresias) {
        println("Membresía: $membresia")
    }

    println("\nMap Mutables")

    val equipos = mutableMapOf(
        "Cintas de correr" to 5,
        "Bicicletas" to 8,
        "Mancuernas" to 30,
        "Bancos" to 10
    )

    // Agregar
    equipos["Elipticas"] = 4
    println(equipos)

    // Actualizar
    equipos["Mancuernas"] = 40
    println(equipos)

    // Eliminar
    equipos.remove("Bancos")
    println(equipos)

    // getOrPut
    equipos.getOrPut("Maquina Smith") { 2 }
    println(equipos)

    equipos.getOrPut("Bicicletas") { 15 }
    println(equipos)
}