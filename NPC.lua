local NPC = {}
NPC.__index = NPC

function NPC.new(x, y, radius, interactFunction)
    local self = setmetatable({}, NPC)

    self.x = x
    self.y = y
    self.radius = radius
    self.interactFunction = interactFunction or function() return end

    return self
end

function NPC:setInteractFunction(interactFunction)
    self.interactFunction = interactFunction
end

function NPC:callInteractFunction()
    self.interactFunction()
end

function NPC:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.circle('line', self.x, self.y, self.radius)
    love.graphics.setColor(1,1,1)
end

return NPC