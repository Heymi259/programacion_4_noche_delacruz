fun main() {

    val nombreGym = "NovaFit"
    val totalSocios: Int = 150
    var nuevosSocios = 0

    nuevosSocios += 1

    println("Bienvenido a $nombreGym")
    println("Total de socios: $totalSocios")
    println("Nuevos socios registrados hoy: $nuevosSocios")

    // Tipos numérnumerosicos
    val maquinas: Byte = 50
    val lockers: Short = 500
    val membresiasActivas: Int = 1200
    val ingresosAnuales: Long = 250000L

    println("Máquinas disponibles: $maquinas")
    println("Lockers disponibles: $lockers")
    println("Membresías activas: $membresiasActivas")
    println("Ingresos anuales: $$ingresosAnuales")

    //  tipos de datos
    val abierto: Boolean = true
    val categoria: Char = 'A'
    val slogan: String = "Transforma tu cuerpo, supera tus límites"

    println("¿Gym abierto?: $abierto")
    println("Categoría: $categoria")
    println("Slogan: $slogan")

    // tipos
    val planPremium = "Premium"
    println("Tipo: ${planPremium::class.simpleName}")

    val costoMensual = 35
    println("Tipo: ${costoMensual::class.simpleName}")

    //   socio
    val nombreSocio = "Heymi"
    val apellidoSocio = "De La Cruz"

    println(
        "Socio registrado: ${
            nombreSocio.uppercase()
        } ${
            apellidoSocio.uppercase()
        }"
    )
}