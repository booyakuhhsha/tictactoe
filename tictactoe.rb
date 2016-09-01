class Player
 attr_accessor :name, :marker

 def initialize(name, marker)
     @name = name
     @marker = marker    
 end

 def turn(position)
 	 Board.update(position,@marker)
 end

end

class Board
 @@position = [0,1,2,3,4,5,6,7,8]

 def self.update(position,marker)
   @@position[position] = marker
 end

 def self.display
   puts "---------------"
   puts "#{@@position[0]} #{@@position[1]} #{@@position[2]}"
   puts "#{@@position[3]} #{@@position[4]} #{@@position[5]}"
   puts "#{@@position[6]} #{@@position[7]} #{@@position[8]}"
   puts "---------------"
 end 
 @@winner = false
 def self.winner
   case 
   when @@position[0] == @@position[1] && @@position[1]== @@position [2] then @@winner = true
   when @@position[3] == @@position[4] && @@position[4]== @@position [5] then @@winner = true
   when @@position[6] == @@position[7] && @@position[7]== @@position [8] then @@winner = true
   when @@position[0] == @@position[3] && @@position[3]== @@position [6] then @@winner = true
   when @@position[1] == @@position[4] && @@position[4]== @@position [7] then @@winner = true
   when @@position[2] == @@position[5] && @@position[5]== @@position [8] then @@winner = true
   when @@position[0] == @@position[4] && @@position[4]== @@position [8] then @@winner = true
   when @@position[2] == @@position[4] && @@position[4]== @@position [6] then @@winner = true	
   end
   return @@winner
 end
end

player1 = Player.new("Dom","x")
player2 = Player.new("Cora","o")

Board.display

while Board.winner == false
	print "Player 1, choose a position to place your marker: "
	input = gets.chomp
	player1.turn(input.to_i)
	Board.display
	next if Board.winner == true
	print "Player 2, choose a position to place your marker: "
	input = gets.chomp
	player2.turn(input.to_i)
	Board.display
end

