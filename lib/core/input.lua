local Input = {}

Input.__index = Input

function Input:new(bindings)
	local instance = {}

	instance.bindings = bindings

	setmetatable(instance, self)
	return instance
end

function Input:init()
	for i, v in pairs(self.bindings) do
	end
end

function Input:released(name)
	for b in #get_bindings(name) do
	end
end

function Input:get_bindings(name)
	return self.bindings[name]
end

return Input
