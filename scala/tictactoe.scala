/*
	An impementation of Noughts and Crosses
	
*/

class Board() {

      var board = Array(" "," "," ",
      	  	        " "," "," ",
			" "," "," ")
      var moveCount = 0

      var nextPlay = "X"

      def printBoard() = {
      	  println("-------")
	  println("|" + board(0) + "|" + board(1) + "|" + board(2) + "|")
      	  println("-------")
	  println("|" + board(3) + "|" + board(4) + "|" + board(5) + "|")	
      	  println("-------")
	  println("|" + board(6) + "|" + board(7) + "|" + board(8) + "|")	
      	  println("-------")

      }

      def switchPlayers() = {
      	  if (nextPlay=="X") {
	     nextPlay="O"
	  } else {
	    nextPlay="X"
	  }
      }

      def samePiece(a:String, b: String, c: String) : Boolean = 
      	  ((a==b) && (b==c)) && (a!=" ")

      def won() =
      	  samePiece(board(0), board(1), board(2)) ||
      	  samePiece(board(3), board(4), board(5)) ||
      	  samePiece(board(6), board(7), board(8)) ||
      	  samePiece(board(0), board(3), board(6)) ||
      	  samePiece(board(1), board(4), board(7)) ||
      	  samePiece(board(2), board(5), board(8)) ||
      	  samePiece(board(0), board(4), board(8)) ||
      	  samePiece(board(2), board(4), board(6))

      def tied():Boolean = (!won) && (moveCount == 9)

      def playGame {
	  if (tied) {
	     println("Tied game.")
	  } else {
      	    if (!won) {
	       play
	       playGame
	    } else {
	     switchPlayers
	     println("Player " + nextPlay + " wins!")
	    }
          }
	}

      def play() {
      	  println("Enter move for player " + nextPlay)
	  val pos = readInt()
	  if ((pos >= 0) && (pos <=8)) {
	     if (board(pos) == " ") {
	     	moveCount = moveCount + 1
	     	board(pos) = nextPlay
		switchPlayers()
		printBoard
	     } else {
	       println("Position " + pos + " is owned by " + board(pos))
	       play() 
	     }
	  } else {
	    println("Move must be an integer from 0-8")
	    play()
	  }
      }
}

val b = new Board
b.printBoard
b.playGame