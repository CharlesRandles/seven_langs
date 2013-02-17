/*
        Building a simple xml emitter
        by overriding forward
*/

Builder := Object clone
Builder init := method(
        tabDepth ::=0 )
Builder tabs := method(
        "\t" repeated(tabDepth))

Builder formatAttrs := method(m,
        attributeString := "" asMutable
        m foreach(k,v,
                attributeString appendSeq(" ", k asMutable removeSeq("\""), "=", v))
        attributeString)

Builder forward := method(
        nextArg := self doMessage(call message arguments at(0))
        if (nextArg type == "Map", attrList := formatAttrs(nextArg), attrList := "")
        writeln(tabs, "<", call message name, attrList,  ">")
        tabDepth = tabDepth + 1
        call message arguments foreach(
                arg,
                content := self doMessage(arg) //Recurse here
                if (content type == "Sequence", writeln(tabs, content)))
        tabDepth = tabDepth - 1
        writeln(tabs, "</", call message name, ">"))

//First, we need to change our syntax a little
Builder curlyBrackets := method(
        attrs := Map clone
        call message arguments foreach(arg,
                attrs atPut(arg name, arg next next name))
        attrs)

with_attrs := Builder clone
with_attrs {"author" : "Tate", "publisher" :"PragProgs"}

with_attrs book({"author" : "Tate", "publisher" :"PragProgs"},
        chapter({"number" : "1"}, "It was a dark and stormy night"),
        chapter({"number" : "2"}, "It was the best of times, it was the worst of times"),
        postscript("We're done here."))