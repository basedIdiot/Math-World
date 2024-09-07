local NPC = {}
NPC.__index = NPC

function NPC.new(x, y, radius, image, interactFunction)
    local self = setmetatable({}, NPC)

    self.x = x
    self.y = y
    self.radius = radius
    self.image = image
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
    -- love.graphics.setColor(0,0,0)
    -- love.graphics.circle('line', self.x, self.y, self.radius)
    -- love.graphics.setColor(1,1,1)
    love.graphics.draw(self.image, self.x, self.y, 0, 0.5, 0.5, self.radius*2, self.radius*2)
end

return NPC