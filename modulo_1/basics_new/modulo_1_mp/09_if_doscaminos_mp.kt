fun main() {

    println("=== NovaFit ===")
    println("If - Dos caminos")
    println("¿Tiene membresía Premium? (s/n)")

    val tienePremium = readLine()?.trim()?.lowercase() == "s"

    println("Costo del plan mensual ($)")
    val costoPlan = readLine()?.toDoubleOrNull() ?: 0.0

    if (tienePremium) {
        val descuento = costoPlan * 0.20
        println("Descuento aplicado: $$descuento")
        println("Valor a pagar: $${costoPlan - descuento}")
    } else {
        println("Valor a pagar: $$costoPlan")
    }
}