fun main() {
    println("If con multiples condiciones anidadas")
    println("El paciente tiene antecedentes cardiacos? s/n")

    val tieneAntecedente = readLine()?.trim() ?.lowercase ()=="s"
    println ("Frecuencia  cardiaca 1pm")

    val frecuencia = readLine ()?. toIntOrNull()?:0
    if (tieneAntecedente) {
       println("Bradicardiaca")
       
    } else if (frecuencia > 100) {
        println("Frecuencia dentro del rango")
    } else {
        println("Paciente sin antecedentes cardiacos")
        if (frecuencia<60 || frecuencia >100){
            println("Frecuencia fuera de lo normal")
        } else {
            println("Frecuencia cardiaca normal")
        }
    }

}