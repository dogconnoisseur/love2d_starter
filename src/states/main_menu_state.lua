local MainMenuState = {}

MainMenuState.__index = MainMenuState

function MainMenuState:enter()
	print("XD")
end

function MainMenuState:draw()
	love.graphics.print("XD")
end

return MainMenuState
