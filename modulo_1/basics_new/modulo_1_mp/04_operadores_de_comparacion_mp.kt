// Operadores de comparación - NovaFit

fun main() {

    var sociosActivos = 120
    var nuevosSocios = 30

    println("sociosActivos == nuevosSocios: ${sociosActivos == nuevosSocios}")
    println("sociosActivos != nuevosSocios: ${sociosActivos != nuevosSocios}")
    println("sociosActivos > nuevosSocios: ${sociosActivos > nuevosSocios}")
    println("sociosActivos < nuevosSocios: ${sociosActivos < nuevosSocios}")
    println("sociosActivos >= nuevosSocios: ${sociosActivos >= nuevosSocios}")
    println("sociosActivos <= nuevosSocios: ${sociosActivos <= nuevosSocios}")

    val plan1 = "Premium"
    val plan2 = "Premium"

    println("plan1 === plan2: ${plan1 === plan2}")
    println("plan1 == plan2: ${plan1 == plan2}")
    println("plan1.equals(plan2): ${plan1.equals(plan2)}")
}