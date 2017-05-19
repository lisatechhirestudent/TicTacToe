# TicTacToe

A web app developed using Ruby, Sinatra, HTML.

Assignment:
Build a Tic-Tac-Toe console application using ruby classes. Player classes should include human, sequential AI, random AI, and ultimately build an unbeatable AI. Once console is working, build out a Sinatra web application for the game.


Strategy:
creation of a tictactoe game for the console and a corresponding web application
games for -
two human players
a human versus a sequential computer
a human versus a random computer
a human versus an unbeatable computer
Major learning construct is class, which is a collection of user defined definitions.
Programs:
app.rb - tictactoe web application
human.rb - get human player's move
sequential.rb - find computer player's next sequential available unoccupied board position
random.rb - find computer player's randomly chosen board position from positions not occupied
unbeatable.rb - get next move/block for a "perfect" player
board.rb - affiliated board class definitions - update board, look for available positions, check for a full board, check for a winner or draw
console.rb - affiliated console game class definitions - draw the game board, change players, obtain a move, update board, check game winner or tie, display game status
playgame.rb - obtain game type (human vs. human, human vs. sequential computer, human vs. random computer, human vs. unbeatable computer) and player's marker (X or O)
Player ‘X’ goes first
Player ‘X’ places their marker on an empty board piece
Next, check to see if player ‘X’ won by getting three ‘X’s in a row
If not, check to see if there is a tie (a full board with no three of a kind in a row)
If neither of these conditions are true, repeat these steps with player ‘O’ instead of player ‘X’