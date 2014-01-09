settings = {
	physicsMeter = 64,

	window = {
		width = 1920,
		height = 1080,
		title = " "
	},

	displayFlags = {
		fullscreen = true,
		fullscreentype = "desktop",
		vsync = true,
		fsaa = 0,
		resizable = false,
		borderless = false,
		centered = true,
		display = 1,
		minwidth = 100,
		minheight = 100
	},

	carrot = {
		width = 160,
		height = 314
	}
}

imageQuad = {
	bunny_off = love.graphics.newQuad(0,0, 1432,1309, 5730,1309),
	bunny_on1 = love.graphics.newQuad(1432,0, 2864,1309, 5730,1309),
	bunny_on2 = love.graphics.newQuad(2864,0, 4296,1309, 5730,1309),
	bunny_on3 = love.graphics.newQuad(4296,0, 5730,1309, 5730,1309)
}

pauseItems = {
	{title = "Resume Game", action = function() paused = false end},
	{title = "Quit Game", action = function() love.event.push("quit") end},
	{title = "Reset Level", action = function() loadLevel(currentLevel) end},
}

pauseHitboxes = {}

deltatime = 0
playtime = 0

paused = false
weldmode = false
welds = {}
toWeld = {}

fps = 0
lastdps = 0
lastfps = 0
playtime = 0
lastclickx, lastclicky = 0, 0

currentlevel = ""

warnings = {}
warnings.noDraw = {}
warnings.noShape = {}
warnings.noClick = {}

infoMessages = {}
fadeOut = {}
scheduled = {}
removals = {}

cursor = love.mouse.newCursor("images/cursor.png", 0, 0)
love.mouse.setCursor(cursor)
font = love.graphics.newFont(20)
love.graphics.setFont(font)

pausebackground = love.graphics.newImage("images/cyanpause.png")
love.physics.setMeter(settings.physicsMeter)
love.window.setTitle(settings.window.title)
love.window.setMode(settings.window.width, settings.window.height, settings.displayFlags)
love.window.setIcon(love.image.newImageData("images/icon.png"))

return settings