class Socio {

    var nombre: String
    var edad: Int
    var membresia: String


    constructor(nombre: String, edad: Int, membresia: String) {
        this.nombre = nombre
        this.edad = edad
        this.membresia = membresia
    }

    
    constructor(nombre: String, edad: Int) {
        this.nombre = nombre
        this.edad = edad
        this.membresia = "Básica"
    }

    fun mostrarInfo() {
        println("Nombre: $nombre")
        println("Edad: $edad")
        println("Membresía: $membresia")
    }
}

fun main() {

    val socio1 = Socio("Heymi", 20, "Premium")

    val socio2 = Socio("Carlos", 25)

    println("=== Socio 1 ===")
    socio1.mostrarInfo()

    println()

    println("=== Socio 2 ===")
    socio2.mostrarInfo()
}