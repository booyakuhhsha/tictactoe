class Player
 attr_accessor :name, :marker

 def initialize(name, marker)
     @name = name
     @marker = marker    
 end

 def turn(position=-1)
   print "#{name}, choose a position to place your marker: "
   position = gets.chomp.to_i
   while Board.checkConflict(position)
     print "#{name}, that position is taken, choose another: "
	 position = gets.chomp.to_i
   end
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

 def self.checkConflict(position)
 	["x","o"].include? @@position[position]
 end

end

player1 = Player.new("Dom","x")
player2 = Player.new("Cora","o")

Board.display

while Board.winner == false
  player1.turn
  Board.display
  puts "#{player1.name} you are the winner!!!" if Board.winner
  next if Board.winner == true
  player2.turn
  Board.display
  puts "#{player2.name} you are the winner!!!" if Board.winner
end

