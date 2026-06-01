// Clase base
open class Persona(
    val nombre: String,
    val rol: String
) {

    open fun presentarse() {
        println("Hola, soy $nombre y mi rol es $rol")
    }

    open fun descripcion(): String {
        return "Persona: $nombre"
    }

    fun ingresarGym() {
        println("$nombre ingresó a NovaFit")
    }
}

// Hereda de Persona
class Socio(nombre: String) : Persona(nombre, "Socio") {

    override fun presentarse() {
        super.presentarse()
        println("Estoy listo para entrenar 💪")
    }

    override fun descripcion(): String {
        return "${super.descripcion()}, miembro de NovaFit"
    }
}

// Hereda de Persona
class Entrenador(
    nombre: String,
    val especialidad: String
) : Persona(nombre, "Entrenador") {

    override fun descripcion(): String {
        return "${super.descripcion()}, especialista en $especialidad"
    }
}

fun main() {

    val socio = Socio("Heymi")

    socio.presentarse()

    println()

    val entrenador = Entrenador(
        "Carlos",
        "Musculación"
    )

    println(entrenador.descripcion())

    println()

    socio.ingresarGym()
}