class Person(first: String) {

      var firstName = first
      var lastName = ""
      def this(first: String, last: String) {
      	  this(first)
	  lastName = last
      }

      def fullName() : String = firstName + " " + lastName 

      def hello() {
      	  println("Hi, my name is " + fullName)
      }
}

class Employee (fn : String, ln: String, title: String)
extends Person(fn, ln) {
     
      val jobTitle = title

      def sayRole()  = println("I'm a " + jobTitle)

}


val eris = new Person("Eris")
eris.hello

val wabbit = new Person("Bugs", "Bunny")
wabbit.hello

val bob = new Employee("Bob", "Dobbs", "Drilling Equipment Salesman")
bob.hello
bob.sayRole