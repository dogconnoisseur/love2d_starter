local Input = {}

Input.__index = Input

function Input:new(bindings)
	local instance = {}

	instance.bindings = bindings
	instance.is_down = {}
	instance.was_down = {}
	instance.bound_keys = {}
	for _, keys in pairs(bindings) do
		for i = 1, #keys do
			instance.bound_keys[i] = keys[i]
		end
	end

	setmetatable(instance, self)
	return instance
end

function Input:update(dt)
	for k in pairs(self.is_down) do
		self.was_down[k] = self.is_down[k]
	end
	for k in pairs(self.was_down) do
		if not self.is_down[k] then
			self.was_down[k] = nil
		end
	end
end

function Input:keypressed(key)
	if self.bound_keys[key] ~= nil then
		self.is_down[key] = true
	end
end

function Input:keyreleased(key)
	if self.bound_keys[key] ~= nil then
		self.is_down[key] = nil
	end
end

function Input:get_bindings(name)
	return self.bindings[name]
end

return Input
