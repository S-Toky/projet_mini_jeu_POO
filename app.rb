require 'bundler'
Bundler.require



require_relative 'lib/game'
require_relative 'lib/player'



player1 = Player.new("Josiane")
player2 = Player.new("José")


while player1.life_point > 0 && player2.life_point > 0
puts "Voici l'état de chaque joueur:"
	player1.show_state
	player2.show_state 

	puts "\n\n"

puts "Passons à la phase d'attaque"
	player1.attacks(player2)
	player2.attacks(player1)

		if player1.life_point <= 0 && player2.life_point <= 0 then
			break
		end
end

#binding.pry