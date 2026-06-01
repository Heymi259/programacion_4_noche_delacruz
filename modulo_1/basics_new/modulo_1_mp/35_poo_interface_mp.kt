abstract class Actividad(val nombre: String) {


    abstract val duracion: Int
    abstract val caloriasQuemadas: Int

    abstract fun descripcion(): String

    fun comparar(otra: Actividad): String = when {
        caloriasQuemadas > otra.caloriasQuemadas ->
            "$nombre quema más calorías que ${otra.nombre}"

        caloriasQuemadas < otra.caloriasQuemadas ->
            "$nombre quema menos calorías que ${otra.nombre}"

        else ->
            "$nombre y ${otra.nombre} queman las mismas calorías"
    }

    override fun toString() =
        "${descripcion()} | Calorías: $caloriasQuemadas"
}

class Cardio : Actividad("Cardio") {

    override val duracion = 45
    override val caloriasQuemadas = 500

    override fun descripcion() =
        "Sesión de cardio de $duracion minutos"
}

class Musculacion : Actividad("Musculación") {

    override val duracion = 60
    override val caloriasQuemadas = 400

    override fun descripcion() =
        "Entrenamiento de musculación de $duracion minutos"
}

class Yoga : Actividad("Yoga") {

    override val duracion = 50
    override val caloriasQuemadas = 250

    override fun descripcion() =
        "Clase de yoga de $duracion minutos"
}

fun main() {

    // Polimorfismo
    val actividades: List<Actividad> = listOf(
        Cardio(),
        Musculacion(),
        Yoga()
    )

    actividades.forEach {
        println(it)
    }

    val mayor =
        actividades.maxByOrNull { it.caloriasQuemadas }

    println("\nActividad que más calorías quema: ${mayor?.nombre}")

    println(
        actividades[0].comparar(
            actividades[1]
        )
    )
}