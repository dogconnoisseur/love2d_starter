local core = require("lib.core")

local state_manager = core.StateManager:new()

function love.load()
	local main_menu_state = require("src.states.main_menu_state")

	state_manager:push(main_menu_state)
end

function love.update(dt)
	state_manager:update(dt)
end

function love.draw()
	state_manager:draw()
end
