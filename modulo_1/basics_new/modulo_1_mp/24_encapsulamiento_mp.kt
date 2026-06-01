class SocioNovaFit(
    nombre: String,
    saldoInicial: Double
) {

    val nombre: String = nombre

    private var saldo: Double = saldoInicial

    internal val codigoSocio: String =
        "NF${(1000..9999).random()}"

    private fun calcularDescuento(): Double = saldo * 0.05

    fun recargarSaldo(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }

        saldo += monto

        println(
            "Recarga: $${"%.2f".format(monto)} | Saldo actual: ${
                consultarSaldo()
            }"
        )
    }

    fun pagarMembresia(monto: Double): Boolean {

        require(monto > 0) { "El monto debe ser positivo" }

        if (monto > saldo) {
            println("Saldo insuficiente")
            return false
        }

        saldo -= monto

        println(
            "Pago realizado: $${"%.2f".format(monto)} | Saldo restante: ${
                consultarSaldo()
            }"
        )

        return true
    }

    fun consultarSaldo(): String =
        "$${"%.2f".format(saldo)}"
}

fun main() {

    val socio = SocioNovaFit(
        "Heymi De La Cruz",
        100.0
    )

    socio.recargarSaldo(50.0)
    socio.pagarMembresia(30.0)
    socio.pagarMembresia(200.0)

    println("Socio: ${socio.nombre}")
    println("Código: ${socio.codigoSocio}")
    println("Saldo: ${socio.consultarSaldo()}")
}