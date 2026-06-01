fun main() {

    println("=== NovaFit ===")
    println("When con condiciones")

    println("Edad del socio:")
    val edad = readLine()?.toIntOrNull() ?: 0

    println("¿Tiene membresía? (s/n)")
    val tieneMembresia = readLine()?.trim()?.lowercase() == "s"

    val tipoMembresia = if (tieneMembresia) {
        println("Tipo de membresía (BASICA, PREMIUM, VIP)")
        readLine()?.trim()?.uppercase() ?: ""
    } else {
        ""
    }

    val descuento = when {
        !tieneMembresia && edad < 18 -> 5.0
        !tieneMembresia && edad <= 60 -> 0.0
        !tieneMembresia && edad > 60 -> 10.0
        tipoMembresia == "BASICA" -> 10.0
        tipoMembresia == "PREMIUM" -> 20.0
        tipoMembresia == "VIP" -> 30.0
        else -> 0.0
    }

    println("Descuento aplicado: ${"%.2f".format(descuento)}%")
}