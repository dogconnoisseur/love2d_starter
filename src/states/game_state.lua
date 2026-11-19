local GameState = {}

GameState.__index = GameState

function GameState:enter()
	print("hi")
end

function GameState:draw()
	love.graphics.print("XD")
end

return GameState
