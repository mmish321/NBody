
class Planets
	G = 6.67408e-11
	attr_accessor :x, :y, :xscaled, :yscaled, :xvel, :yvel,:mass,:total_force, :name, :acceleration, :xforce, :yforce, :xaccel, :yaccel
	def initialize(x,y,xvel,yvel,mass,img,radius)
		@x = x
		@y = y
		@xscaled = 0
		@yscaled = 0
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@img = Gosu::Image.new("images/#{img}")
		@radius = radius
		@total_force = 0.0
		@xforce= 0.0
		@yforce = 0.0
		@xaccel = 0.0
		@yaccel = 0.0
		@name = img
	end
	
	def draw
		@img.draw(@xscaled - @img.width / 2.0, @yscaled - @img.height / 2.0 ,1)
	end
	 def calculate_total_force(planet)
		xdist = @x- planet.x
	 	ydist = @y - planet.y
	 	dist = Math.sqrt((xdist**2) + (ydist**2))
	 	@total_force = ((G*@mass*planet.mass)/(dist**2))
	 	@xforce -= (@total_force * xdist) / dist
		@yforce -= (@total_force * ydist) /dist
		
	end
	def calculate_accel
	 	 @xaccel =  (@xforce / @mass)
	 	 @yaccel = (@yforce / @mass)
	 	 @xforce = 0
	 	 @yforce = 0
	 end
	 def calculate_velocity
	 	 @xvel = (@xvel + 10000 * @xaccel)
		 @yvel = (@yvel + 10000* @yaccel)
	 end
	def calculate_position
	 	 @x +=  @xvel* 10000
	 	 @y += @yvel * 10000
	 	@xscaled =(@x /(@radius *2)) +250
		@yscaled =(-@y/(@radius*2)) +250
	end


end