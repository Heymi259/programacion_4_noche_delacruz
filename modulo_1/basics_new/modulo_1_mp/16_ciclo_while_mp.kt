fun main() {

    println("=== NovaFit - Ciclos While ===")

    println("While básico")

    var contador = 1

    while (contador <= 5) {
        println("Entrenamiento #$contador")
        contador++
    }

    contador = 1

    println("\nDo While")

    do {
        println("Sesión #$contador")
        contador++
    } while (contador <= 5)

    println("\nBreak y Continue")

    contador = 1

    while (contador <= 10) {

        contador++

        if (contador == 3) continue

        if (contador == 7) break

        println("Máquina $contador disponible")
    }

    var input: String

    while (true) {

        println("\nEscribe 'salir' para finalizar el registro")
        input = readLine() ?: ""

        if (input.lowercase() == "salir") break

        println("Socio registrado: $input")
    }

    println("Sistema NovaFit finalizado")
}