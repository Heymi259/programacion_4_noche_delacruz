class SalaEntrenamiento(
    val ancho: Double,
    val largo: Double
) {

    val area: Double
        get() = ancho * largo

    val perimetro: Double
        get() = 2 * (ancho + largo)

    // Constructor para sala cuadrada
    constructor(lado: Double) : this(lado, lado)

    // Constructor usando enteros
    constructor(ancho: Int, largo: Int)
            : this(ancho.toDouble(), largo.toDouble())

    override fun toString() =
        "Sala NovaFit (${ancho}m x ${largo}m) | Área = ${area} m²"
}

fun main() {

    val salaPesas = SalaEntrenamiento(10.0, 8.0)

    val salaYoga = SalaEntrenamiento(6.0)

    val salaCardio = SalaEntrenamiento(12, 5)

    println(salaPesas)
    println("Perímetro: ${salaPesas.perimetro} m")

    println()

    println(salaYoga)
    println("Perímetro: ${salaYoga.perimetro} m")

    println()

    println(salaCardio)
    println("Perímetro: ${salaCardio.perimetro} m")
}