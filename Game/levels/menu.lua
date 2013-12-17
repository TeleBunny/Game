function load()
	love.window.setIcon(love.image.newImageData("images/icon.png"))
	world = love.physics.newWorld(0, 9.81*64, true)

	objects = {}

	objects.background = {}
	objects.background.draw = backgroundDraw
	objects.background.click = backgroundClick

end

function backgroundDraw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 0, 0, settings.window.width, settings.window.height)

	love.graphics.setColor(0,0,0)
	line = "Click to begin!"
	love.graphics.print(line, getCenterCoords(line, "x"), getCenterCoords(line, "y"))
end

function backgroundClick()
	loadWorld("test")
end

return load