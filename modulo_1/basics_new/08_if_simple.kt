fun main() {

    println("Control de Flujo")
    println("if Simple")
    println("Temperatura corporal del paciente grados centig.")


    val temperatura= readLine()?.toDoubleOrNull()?:35.5
    if(temperatura>=38){
        println("Fiebre detectada")
    }
    if(temperatura>=40){
        println("Fiebre Alta")
    }

    println("Temperatura registrada: $temperatura")

 
}