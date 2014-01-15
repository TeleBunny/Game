function load()
	love.window.setTitle("Telekinetic Bunny")
	setFontSize(14)

	world = love.physics.newWorld(0, 9.81*64, true)

	carrotSprite = love.graphics.newImage("images/carrot.png")
	scientistSprite = love.graphics.newImage("images/scientist_final.png")

	scientistWidth = 277
	scientistHeight = 329

	objects = {
		ground = {
			body = love.physics.newBody(world, settings.window.width, settings.window.height-(100), "static"),
			shape = love.physics.newRectangleShape(settings.window.width*2, 10),
			draw = function()
				love.graphics.setColor(50,205,50)
				love.graphics.rectangle("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))
			end,
			afterload = [[
				objects.ground.fixture:setFriction(1.2)
			]]
		},
		leftwall = {
			body = love.physics.newBody(world, 0, settings.window.height/2, "static"),
			shape = love.physics.newRectangleShape(0, settings.window.height),
			draw = function() end,
		},
		rightwall = {
			body = love.physics.newBody(world, settings.window.width, settings.window.height/2, "static"),
			shape = love.physics.newRectangleShape(0, settings.window.height),
			draw = function() end,
		},
		topwall = {
			body = love.physics.newBody(world, 0,0, "static"),
			shape = love.physics.newRectangleShape(settings.window.width*2, 0),
			draw = function() end,
		},
		carrot = {
			body = love.physics.newBody(world, 500, 1, "dynamic"),
			shape = love.physics.newPolygonShape(118,0, 80,50, 37,127, -8,320, 8,330, 145,163, 160,40, 158,38),
			draw = function()
				--love.graphics.polygon("line", objects.carrot.body:getWorldPoints(objects.carrot.shape:getPoints()))
				love.graphics.draw(carrotSprite, objects.carrot.body:getX(), objects.carrot.body:getY(), objects.carrot.body:getAngle(), objects.carrot.sx, objects.carrot.sy, scalex, scaley)
			end,
			click = function() end,
			xpos = 0,
			ypos = 0,
			afterload = [[
				objects.carrot.fixture = love.physics.newFixture(objects.carrot.body, objects.carrot.shape)
				tlx, tly, brx, bry = objects.carrot.fixture:getBoundingBox()
				objects.carrot.sx = (brx-tlx)/carrotSprite:getWidth()
				objects.carrot.sy = (bry-tly)/carrotSprite:getHeight()
			]]
		},
		scientist = {
			body = love.physics.newBody(world, 300, settings.window.height-200, "dynamic"),
			shape = love.physics.newRectangleShape(0,0, 277,329),
			draw = function()
				love.graphics.draw(scientistSprite, objects.scientist.body:getX(), objects.scientist.body:getY(), objects.scientist.body:getAngle(), 0.1, 0.1, scientistSprite:getWidth()/2, scientistSprite:getHeight()/2)
				love.graphics.polygon("line", objects.scientist.body:getWorldPoints(objects.scientist.shape:getPoints()))
			end,
			click = function() end,
		},
		box1 = {
			body = love.physics.newBody(world, 25, 25, "dynamic"),
			shape = love.physics.newRectangleShape(0,0, 50,50),
			draw = function() 
				love.graphics.polygon("fill", objects.box1.body:getWorldPoints(objects.box1.shape:getPoints()))
			end,
			click = function() end,
		},
		box2 = {
			body = love.physics.newBody(world, 25, 25, "dynamic"),
			shape = love.physics.newRectangleShape(0,0, 50,50),
			draw = function()
				love.graphics.polygon("fill", objects.box2.body:getWorldPoints(objects.box2.shape:getPoints()))
			end,
			click = function() end,
			afterload = [[
				boxjoint = love.physics.newRevoluteJoint(objects.box1.body, objects.box2.body, 50,50, false)
			]]
		}
	}
	require "bunny"
end



stime = 0
function scientistAI(dt)
	--
end

function updateLevel(dt)
	scientistAI(dt)
end

function beginContact(a, b, coll)
	avel = math.abs(a:getBody():getLinearVelocity())
	bvel = math.abs(b:getBody():getLinearVelocity())

	--addInfo("Collision! Velocity: "..a:getBody():getLinearVelocity().. " and "..b:getBody():getLinearVelocity(), 1)
	if objects.scientist ~= nil then
		if a == objects.scientist.fixture or b == objects.scientist.fixture then
			if avel > 600 or bvel > 600 then
				if fadeOut["scientist"] == nil then
					--objects.scientist.fadeout(100)
				end
				yell = "[Scientist:] "
				force = math.max(avel, bvel)
				repeat
					yell = yell.."A"
					force = force - 150
				until force <= 0
				yell = yell.."!"
				addInfo(yell, 5)
			end
		end
	end
end

function endContact(a, b, coll) end
function preSolve(a, b, coll) end
function postSolve(a, b, coll) end

return load