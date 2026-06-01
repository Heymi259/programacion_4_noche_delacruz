class Socio(
    val nombre: String,
    val correo: String
) {

    val nombreNormalizado: String
    val dominioCorreo: String

    init {


        require(nombre.isNotBlank()) {
            "El nombre del socio no puede estar vacío"
        }

        require(correo.contains("@")) {
            "Correo inválido: $correo"
        }

        nombreNormalizado = nombre.trim().uppercase()
        dominioCorreo = correo.substringAfter("@")
    }
}

fun main() {

    val socio = Socio(
        "  Heymi De La Cruz  ",
        "heymi@novafit.com"
    )

    println("Nombre normalizado: ${socio.nombreNormalizado}")
    println("Dominio del correo: ${socio.dominioCorreo}")

    // Socio("", "correo_invalido")
    // Generaría IllegalArgumentException
}