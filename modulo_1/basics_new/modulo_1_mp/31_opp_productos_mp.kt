data class Categoria(
    val id: Int,
    val nombre: String
)

data class PlanEntrenamiento(
    val id: Int,
    val nombre: String,
    val precio: Double,
    val cupos: Int,
    val categoria: Categoria,
    val activo: Boolean = true
) {

    // Abstracción
    val disponible: Boolean
        get() = activo && cupos > 0

    val precioConIva: Double
        get() = precio * 1.15

    fun aplicarDescuento(porcentaje: Double): PlanEntrenamiento {

        require(porcentaje in 0.0..100.0) {
            "El descuento debe estar entre 0 y 100"
        }

        return copy(
            precio = precio * (1 - porcentaje / 100)
        )
    }
}

object CatalogoNovaFit {

    private val categorias = mutableListOf(
        Categoria(1, "Musculación"),
        Categoria(2, "Cardio"),
        Categoria(3, "Clases Grupales")
    )

    private val planes = mutableListOf<PlanEntrenamiento>()

    private var siguienteId = 1

    fun agregarPlan(
        nombre: String,
        precio: Double,
        cupos: Int,
        categoriaId: Int
    ): PlanEntrenamiento? {

        val categoria =
            categorias.find { it.id == categoriaId }
                ?: return null

        val plan = PlanEntrenamiento(
            siguienteId++,
            nombre,
            precio,
            cupos,
            categoria
        )

        planes.add(plan)

        return plan
    }

    fun listar(): List<PlanEntrenamiento> =
        planes.toList()

    fun disponibles(): List<PlanEntrenamiento> =
        planes.filter { it.disponible }

    fun porCategoria(id: Int): List<PlanEntrenamiento> =
        planes.filter { it.categoria.id == id }

    fun buscar(texto: String): List<PlanEntrenamiento> =
        planes.filter {
            it.nombre.contains(
                texto,
                ignoreCase = true
            )
        }
}

fun main() {

    CatalogoNovaFit.agregarPlan(
        "Plan Básico",
        25.0,
        20,
        1
    )

    CatalogoNovaFit.agregarPlan(
        "Plan Premium",
        40.0,
        10,
        2
    )

    CatalogoNovaFit.agregarPlan(
        "CrossFit Elite",
        60.0,
        0,
        3
    )

    CatalogoNovaFit.agregarPlan(
        "Yoga Integral",
        35.0,
        15,
        3
    )

    println("=== Planes NovaFit ===")

    CatalogoNovaFit.listar().forEach { plan ->

        val estado =
            if (plan.disponible) "✅"
            else "❌"

        println(
            "$estado ${plan.nombre} - " +
            "$${"%.2f".format(plan.precioConIva)} (IVA incluido)"
        )
    }

    println("\n=== Planes disponibles con 15% de descuento ===")

    CatalogoNovaFit.disponibles()
        .map { it.aplicarDescuento(15.0) }
        .forEach {
            println(
                "${it.nombre}: " +
                "$${"%.2f".format(it.precio)}"
            )
        }
}