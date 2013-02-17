/*
        Building a simple xml emitter
        by overriding forward
*/

Builder := Object clone
Builder init := method(
        tabDepth ::=0 )
Builder tabs := method(
        "\t" repeated(tabDepth))

Builder forward := method(
        writeln(tabs, "<", call message name, ">")
        tabDepth = tabDepth + 1
        call message arguments foreach(
                arg,
                content := self doMessage(arg) //Recurse here
                if (content type == "Sequence", writeln(tabs, content)))
        tabDepth = tabDepth - 1
        writeln(tabs, "</", call message name, ">"))

builder := Builder clone
builder ul(
        li("Io"),
        li("Lua"),
        li("Javascript"),
        li("Self"))
"************" println
with_attrs := Builder clone
with_attrs book()