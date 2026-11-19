local StateManager = {}

StateManager.__index = StateManager

local function has_function(tbl, key)
	if type(tbl) ~= "table" then
		return false
	end
	return type(tbl[key]) == "function"
end

function StateManager:new()
	local instance = {}
	instance.stack = {}
	setmetatable(instance, self)
	return instance
end

function StateManager:switch(state)
	local old_state = self:get_current_state()

	if has_function(state, "enter") then
		if has_function(old_state, "exit") then
			old_state:exit()
		end
		state:enter()
		self.stack[#self.stack] = state
	else
		error("StateManager:switch - argument doesnt have enter().", 2)
	end
end

function StateManager:push(state)
	local old_state = self:get_current_state()

	if has_function(state, "enter") then
		state:enter(old_state)
		table.insert(self.stack, state)
	else
		error("StateManager:push - argument doesnt have enter().", 2)
	end
end

function StateManager:pop()
	local old_state = self:get_current_state()

	if has_function(old_state, "exit") then
		old_state:exit()
	end
	table.remove(self.stack)
	if has_function(self:get_current_state(), "resume") then
		self:get_current_state():resume()
	end
end

function StateManager:get_current_state()
	return self.stack[#self.stack]
end

function StateManager:update(dt)
	if has_function(self:get_current_state(), "update") then
		self:get_current_state():update(dt)
	end
end

function StateManager:draw()
	self:get_current_state():draw()
end

return StateManager
