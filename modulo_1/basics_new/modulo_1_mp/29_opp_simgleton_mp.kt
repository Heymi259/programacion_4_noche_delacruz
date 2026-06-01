object ConfiguracionNovaFit {

    val nombreGym: String = "NovaFit"
    val ciudad: String = "Quito"

    private val codigoInterno: String = "NF2026"

    fun informacion() =
        "$nombreGym - $ciudad"

    fun obtenerCodigo() =
        "Código interno protegido"
}

class Socio private constructor(
    val id: Int,
    val nombre: String
) {

    companion object {

        private var contadorId = 0

        fun crear(
            nombre: String,
            correo: String
        ): Socio? {

            if (
                nombre.isBlank() ||
                !correo.contains("@")
            ) {
                return null
            }

            return Socio(
                ++contadorId,
                nombre.trim()
            )
        }

        const val MEMBRESIA_DEFECTO = "Básica"
    }

    override fun toString(): String {
        return "Socio(id=$id, nombre=$nombre)"
    }
}

fun main() {

    println(ConfiguracionNovaFit.informacion())

    // println(ConfiguracionNovaFit.codigoInterno)
    // ERROR porque es private

    val socio1 =
        Socio.crear(
            "Heymi",
            "heymi@novafit.com"
        )

    val socio2 =
        Socio.crear(
            "Carlos",
            "carlos@novafit.com"
        )

    println(socio1)
    println(socio2)

    println(
        "Membresía por defecto: ${
            Socio.MEMBRESIA_DEFECTO
        }"
    )
}