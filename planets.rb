
class Planets
	G = 6.67408e-11
	attr_accessor :x, :y, :xvel, :yvel,:mass,:total_force, :name
	def initialize(x,y,xvel,yvel,mass,img,name,radius)
		@x = x
		@y = y
		@xscaled =(x /(radius *2)) + 250
		@yscaled =(y/radius) + 250
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@img = Gosu::Image.new("images/#{img}")
		@radius = radius
		@total_force = 0
		@name = name
	end
	
	def draw
		@img.draw(@xscaled - @img.width / 2.0, @yscaled - @img.height / 2.0 ,1)
	end
		def calculate_gravity(planet)
		xdist =(x - planet.y).abs
		ydist = (y - planet.y).abs
		dist = Math.sqrt(xdist**2 + ydist**2)
		@total_force += ((G*mass*planet.mass)/dist**2)
	end



end