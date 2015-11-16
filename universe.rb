require "gosu"
require_relative "planets"


class Universe < Gosu::Window
	attr_accessor :radius
	def initialize
		super 500, 500
		self.caption = "Universe, heck yeah"
		@background_image = Gosu::Image.new("images/starmap.jpg", :tileable => true)
		data=File.read("planets.txt")
		lines = data.split("\n")
		@number_of_planets = lines[0]
		@radius = lines[1]
		@planets_data = lines[2...lines.length]
		@planets = []
		@planets_data.each {|planet| 
			planet = planet.split(",")
			@planets.push(Planets.new(planet[0].to_f,planet[1].to_f,planet[2].to_f,planet[3].to_f,planet[4].to_f,planet[5]))
		}
	end

	def update
		
	end

	def draw
		@background_image.draw(0,0,0)
	end


end

window = Universe.new
window.show