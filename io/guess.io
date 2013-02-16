/*
        Let's have a silly guessing game
*/

Game := Object clone

Game init := method(
        guesses ::= 0
        lastGuess ::= nil
        stdi ::= File standardInput
        target ::= ((((Random value) * 100) round) + 1)
        finished ::= false)

Game diff := method (n, (n - target) abs)

Game play := method(
        guess := stdi readLine() asNumber()
        guesses = guesses + 1
        if (guess == target, finished = true,
                if (lastGuess != nil,
                        if (diff(guess) < diff(lastGuess), "Warmer" println, "Colder" println))
                lastGuess = guess
                "Try again" println))

game := Game clone
"Guess a number between 1 and 100" println
while ( game finished == false,
        game play)
"Woop Woop" println
"I had thought of " print; game target println
"You guessed it in " print; game guesses print; " tries." println
