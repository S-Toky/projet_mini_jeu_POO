#require 'pry'

class Player
	attr_accessor :name, :life_point

	def initialize(name)
		@name = name
		@life_point = 10
	end

	def show_state
		 puts "#{name} a #{life_point} points de vie"	
	end

	def gets_domage(n)
		n = n.to_i
	 	@life_point -= n
		if @life_point <=0 
			puts "le joueur #{name} a été tué"
		else
			return @life_point
		end
	end

	def attacks(nom)
		puts "le joueur #{name} attaque le joueur #{nom.name}"
		number_point = compute_damage
		puts "il lui a infligé #{number_point} points de domage"
		nom.gets_domage(number_point)
	end

	def compute_damage
		return rand(1..6)
	end
end

class HumanPlayer < Player 
	attr_accessor :weapon_level

	def initialize(name, weapon_level=1)
		@weapon_level = weapon_level
		super (name)
		@life_point = 100	
	end

	def show_state
		puts "#{name} a #{life_point} points de vie et une arme de niveau #{weapon_level}"
	end

	def compute_damage
		return rand(1..6)*@weapon_level
	end

	def search_weapon
  	tmp = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{tmp}"
    if tmp <= @weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    else
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
     end
  end

  def search_health_pack
  	point = rand(1..6)
  		puts "tu as trouvé #{point} points de bonus"
  	if point == 1 
  		puts "tu n'as rien trouvé..."
  	elsif
   		point >=2 && point <=5 
  		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  		@life_point = life_point + 50
  		  if @life_point > 100
  					@life_point = 100
  			end 
  	elsif
  	 point == 6
  	 puts "Waow, tu as trouvé un pack de +80 points de vie !"
  	 @life_point = life_point + 80
  	  if @life_point > 100
  				@life_point = 100
 			 end 
  	else
  		puts "ton point de vie est #{name.show_state}"
  	end
  end
end

#binding.pry