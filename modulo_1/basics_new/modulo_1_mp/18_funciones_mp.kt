fun main() {

    bienvenida()
    registrarSocio("Heymi")

    val sociosActuales = 100
    val nuevosSocios = 20

    println(
        "Total de socios: $sociosActuales + $nuevosSocios = ${
            sumarSocios(sociosActuales, nuevosSocios)
        }"
    )

    println(
        "Socios restantes: $sociosActuales - $nuevosSocios = ${
            restarSocios(sociosActuales, nuevosSocios)
        }"
    )

    entrenamiento()

    println(
        "Ingreso mensual: 30 * 100 = ${
            calcularIngresos(30, 100)
        }"
    )
}

// Función simple
fun bienvenida() {
    println("¡Bienvenido a NovaFit!")
}

// Función con parámetros
fun registrarSocio(nombre: String) {
    println("Socio registrado: $nombre")
}

// Función con retorno
fun sumarSocios(actuales: Int, nuevos: Int): Int {
    return actuales + nuevos
}

// Función simplificada
fun restarSocios(actuales: Int, bajas: Int) = actuales - bajas

// Función dentro de función
fun entrenamiento() {

    fun caloriasQuemadas(minutos: Int) = minutos * 8

    println("Calorías quemadas en 30 min: ${caloriasQuemadas(30)}")
}

// Función lambda
val calcularIngresos = { costoMensual: Int, cantidadSocios: Int ->
    costoMensual * cantidadSocios
}