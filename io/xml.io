/*
        Building a simple xml emitter
        by overriding forward
*/

Builder := Object clone
Builder forward := method(
        writeln("<", call message name, ">")
        call message arguments foreach(
                arg,
                content := self doMessage(arg) //Recurse here
                if (content type == "Sequence", writeln(content)))
        writeln("<", call message name, ">"))

Builder ul(
        li("Io"),
        li("Lua"),
        li("Javascript"),
        li("Self"))

