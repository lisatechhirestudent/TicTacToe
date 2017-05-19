# TicTacToe

A web app developed using Ruby, Sinatra, HTML, CSS and JavaScript.

Assignment:
Build a Tic-Tac-Toe console application using ruby classes. Player classes should include human, sequential AI, random AI, and ultimately build an unbeatable AI. Once console is working, build out a Sinatra web application for the game.
rackup required to start app running on port 9292
File Index
app.rb # App file used for Sinatra web app
board.rb # TTTBoard class definitions (test_board.rb)
console.rb # TTT Console setup (test_console.rb)
human.rb # File for human player logic (test_human.rb)
invincible.rb # AI for unbeatable player logic (test_invincible.rb)
playgame.rb # launch file on console with case selection
playme.rb # launch file uses primarily during testing; manual entry of player class to run is required
random.rb # AI randomly selects next position for board (test_random.rb)
sequential.rb # AI sequentially identifies position for board (test_sequential.rb) Folders 
\public # folder to host styles and images for web app 
\images\tic_tac_toe.png displays on main page
\reference # folder to host reference notes used while building invincible logic
\tests # folder to host test files for code sections and web app
\views # folder to host views for web app 
\views\ai_only.erb # shows computer vs computer play, with button to click to advance each move
\views\display_result.erb # shows final board with Win/Tie result
\human_involved.erb # prompts user to select a number from 1-9 to play
\human_involved2.erb # allows user to click the spot on the board to play
\layout.erb # main layout with menu of playable options
\tictactoe_intro.erb # Welcome message and image file


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
humanp.rb - get human player's move
sequentialp.rb - find computer player's next sequential available unoccupied board position
randomp.rb - find computer player's randomly chosen board position from positions not occupied
unbeatablep.rb - get next move/block for a "perfect" player
boardp.rb - affiliated board class definitions - update board, look for available positions, check for a full board, check for a winner or draw
consolep.rb - affiliated console game class definitions - draw the game board, change players, obtain a move, update board, check game winner or tie, display game status
playgamep.rb - obtain game type (human vs. human, human vs. sequential computer, human vs. random computer, human vs. unbeatable computer) and player's marker (X or O)
Player ‘X’ goes first
Player ‘X’ places their marker on an empty board piece
Next, check to see if player ‘X’ won by getting three ‘X’s in a row
If not, check to see if there is a tie (a full board with no three of a kind in a row)
If neither of these conditions are true, repeat these steps with player ‘O’ instead of player ‘X’