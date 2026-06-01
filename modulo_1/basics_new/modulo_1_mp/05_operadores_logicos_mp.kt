fun main() {

    println("=== Operadores Lógicos - NovaFit ===")

    val membresiaActiva = true
    val pagoAlDia = false
    val accesoGym = true
    val entrenadorDisponible = false

    println("Operador AND (&&)")
    println("$membresiaActiva && $pagoAlDia = ${membresiaActiva && pagoAlDia}")
    println("$membresiaActiva && $accesoGym = ${membresiaActiva && accesoGym}")

    println("\nOperador OR (||)")
    println("$membresiaActiva || $pagoAlDia = ${membresiaActiva || pagoAlDia}")
    println("$membresiaActiva || $accesoGym = ${membresiaActiva || accesoGym}")
    println("$entrenadorDisponible || $pagoAlDia = ${entrenadorDisponible || pagoAlDia}")
    println("$entrenadorDisponible || $pagoAlDia || $accesoGym = ${entrenadorDisponible || pagoAlDia || accesoGym}")

    println("\nOperador NOT (!)")
    println("!$membresiaActiva = ${!membresiaActiva}")
    println("!$entrenadorDisponible = ${!entrenadorDisponible}")
}