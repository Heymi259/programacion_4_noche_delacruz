interface Registrable {

    val id: String

    fun registrar(): String

    val version: Int
        get() = 1
}

interface Validable {

    val errores: List<String>

    val esValido: Boolean
        get() = errores.isEmpty()

    fun validar(): Boolean

    fun imprimirErrores() {
        if (errores.isEmpty()) {
            println("✅ Sin errores")
        } else {
            errores.forEach {
                println("❌ $it")
            }
        }
    }
}

// Un socio puede ser Registrable y Validable
data class Socio(
    override val id: String,
    val nombre: String,
    val membresia: String,
    val edad: Int
) : Registrable, Validable {

    override fun registrar(): String =
        "$id|$nombre|$membresia|$edad"

    override val errores: List<String>
        get() = buildList {

            if (nombre.isBlank()) {
                add("El nombre no puede estar vacío")
            }

            if (membresia.isBlank()) {
                add("Debe seleccionar una membresía")
            }

            if (edad < 16) {
                add("La edad mínima es 16 años")
            }
        }

    override fun validar() = esValido
}

fun main() {

    val socio1 = Socio(
        "S001",
        "Heymi",
        "Premium",
        20
    )

    val socio2 = Socio(
        "S002",
        "",
        "",
        14
    )

    fun procesarRegistro(r: Registrable) {
        println("📋 Registro: ${r.registrar()}")
    }

    fun procesarValidacion(v: Validable) {
        println("¿Registro válido?: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarRegistro(socio1)

    println()

    procesarValidacion(socio1)

    println()

    procesarValidacion(socio2)
}