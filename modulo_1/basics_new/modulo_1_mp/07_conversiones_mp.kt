fun main() {

    println("=== Conversiones de Datos - NovaFit ===")

    println("Conversión de números")

    val sociosActivos: Int = 120

    val sociosDouble: Double = sociosActivos.toDouble()
    val sociosLong: Long = sociosActivos.toLong()
    val sociosString: String = sociosActivos.toString()

    println("Socios en Double: $sociosDouble")
    println("Socios en Long: $sociosLong")
    println("Socios en String: $sociosString")

    println("\nConversión desde String")

    val costoMensual = "35".toInt()
    val porcentajeGrasa = "18.5".toDouble()

    println("Costo mensual: $costoMensual")
    println("Porcentaje de grasa corporal: $porcentajeGrasa")

    val datoInvalido = "NovaFit".toIntOrNull()

    println("Conversión inválida: $datoInvalido")
}