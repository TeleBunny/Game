function getGroundHeight()
	if currentLevel == 2 then return 1020 end
	return 980
end
ground = {
	body = love.physics.newBody(world, 0, getGroundHeight(), "static"),
	shape = love.physics.newRectangleShape(100000, 10),
	draw = function()
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("line", ground.body:getWorldPoints(ground.shape:getPoints()))
	end,
}
rightwall = {
	body = love.physics.newBody(world, 1920, 1080/2, "static"),
	shape = love.physics.newRectangleShape(0, 100000),
}
if currentLevel ~= 4 and currentLevel ~= 5 then
	topwall = {
		body = love.physics.newBody(world, 0,0, "static"),
		shape = love.physics.newRectangleShape(10000, 0),
	}
	topwall.fixture = love.physics.newFixture(topwall.body, topwall.shape)
	topwall.fixture:setRestitution(0.1)
end

if currentLevel == 1 then
	leftwall = {
		body = love.physics.newBody(world, 0, 0, "static"),
		shape = love.physics.newRectangleShape(0, 850),
	}
	leftwall.fixture = love.physics.newFixture(leftwall.body, leftwall.shape)
	shelf = {
		body = love.physics.newBody(world, 240, 375, "static"),
		shape = love.physics.newRectangleShape(355, 12)
	}
	shelf.fixture = love.physics.newFixture(shelf.body, shelf.shape)
elseif currentLevel == 2 then
	shelf1 = {
		body = love.physics.newBody(world, 1590, 390, "static"),
		shape = love.physics.newRectangleShape(355, 12)
	}
	shelf1.fixture = love.physics.newFixture(shelf1.body, shelf1.shape)
elseif currentLevel == 3 then
	shelf1 = {
		body = love.physics.newBody(world, 270, 270, "static"),
		shape = love.physics.newRectangleShape(360, 12)
	}
	shelf1.fixture = love.physics.newFixture(shelf1.body, shelf1.shape)
end

ground.fixture = love.physics.newFixture(ground.body, ground.shape)
rightwall.fixture = love.physics.newFixture(rightwall.body, rightwall.shape)
rightwall.fixture:setRestitution(0.1)
ground.fixture:setFriction(1.2)

loadObject = function() end