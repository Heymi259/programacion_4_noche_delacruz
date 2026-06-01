fun main() {

    println("=== NovaFit - Funciones Lambda ===")

  
    val totalSocios: (Int, Int) -> Int = { actuales: Int, nuevos: Int ->
        actuales + nuevos
    }

    println("Total de socios: ${totalSocios(100, 20)}")

    
    val ingresosMensuales: (Int, Int) -> Int = { costo, socios ->
        costo * socios
    }

    println("Ingresos mensuales: $${ingresosMensuales(30, 100)}")

    
    val caloriasQuemadas: (Int) -> Int = { it * 8 }

    println("Calorías en 30 min: ${caloriasQuemadas(30)}")
}