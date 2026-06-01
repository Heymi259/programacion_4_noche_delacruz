fun main() {

    println("=== NovaFit - Ciclos For ===")

    println("Entrenamientos de la semana")
    for (i in 1..5) {
        println("Día de entrenamiento: $i")
    }

    println("\nUntil")
    for (i in 1 until 5) {
        println("Rutina #$i")
    }

    println("\nDownTo")
    for (i in 10 downTo 1) {
        println("Cuenta regresiva para iniciar ejercicio: $i")
    }

    println("\nLista de socios")
    val socios = listOf("Heymi", "Carlos", "Andrea")

    for (socio in socios) {
        println(socio)
    }

    println("\nÍndice y valor")
    for ((index, valor) in socios.withIndex()) {
        println("$index: $valor")
    }

    println("\nBreak")
    for (i in 1..5) {
        if (i == 3) {
            break
        }
        println("Máquina $i disponible")
    }

    println("\nContinue")
    for (i in 1..5) {
        if (i == 3) {
            continue
        }
        println("Estación de ejercicio $i")
    }
}