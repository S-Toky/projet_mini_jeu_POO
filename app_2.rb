require 'bundler'
Bundler.require



require_relative 'lib/game'
require_relative 'lib/player'

puts "************************************************"
puts "|             🎮 BIENVENUE 🎮                  |"
puts "|          🔞 THIS IS THE GAME 🔞              |"
puts "| This is a game where you have to live or die |"
puts "************************************************"

puts "Presente toi pour jouer"
print ">"
toi = gets.chomp
user = HumanPlayer.new(toi)
 
 puts "\n"

puts "voici tes points"
user.show_state

puts "\n"
enemie = [player1 = Player.new("Josiane"), player2 = Player.new("José")]

puts "tes enemies:"
player1.show_state
player2.show_state

puts "\n"

puts "****************** GAME IS ON *****************\n"

while user.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0)
	puts "Voici l'état de chaque joueur:"
	user.show_state
	player1.show_state
	player2.show_state 

	puts "\n\n"

puts "************Passons à la phase d'attaque***************\n\n"

			puts "\n"

			puts "veux tu connaitre ton niveau actuel ? oui/non"
			ask = gets.chomp

			if ask == "oui"
				user.show_state
			elsif ask == "non"
				puts "Game is run"
 			end

				puts "\n"

			puts "Quel action veux-tu faire?\n"
			puts "a - chercher une meilleur arme"
			puts "b - chercher à se soigner"

			choix = gets.chomp 
			if choix == "a"
			 		 user.search_weapon
				elsif choix == "b"
					user.search_health_pack
		end

			puts user.show_state

			puts "\n"

			puts "attaquer un joueur en vue:"
			puts "0 - #{player1.name} a #{player1.life_point} point de vie"
			puts "1 - #{player2.name} a #{player2.life_point} point de vie"

			choice = gets.chomp
			if choice == "0"
				user.attacks(player1)
			elsif choice == "1"
				user.attacks(player2)
			end

			puts user.show_state
			puts player1.show_state
			puts player2.show_state

			puts "\n"

			puts "************ attaque des enemies **************"

			enemie.each do |play|
				if player1.life_point <= 0 
					player2.attacks(user)
				elsif player2.life_point <= 0
					player1.attacks(user)
				else	
				play.attacks(user)
			end
		end
		
	
		if (player1.life_point <= 0 || player2.life_point <= 0) && user.life_point <=0 then
			break
		end
		
end

puts "************************************************"
puts "|             🎮 GAME OVER 🎮                  |"
puts "|        😎😎THANKS FOR PLAYING 😎😎           |"
puts "************************************************"
