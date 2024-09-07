local Player = {}
Player.__index = Player

function Player.new(x, y)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.speed = 150
    return self
end

function Player:update(dt)
    if love.keyboard.isScancodeDown('a', 'left') then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isScancodeDown('d', 'right') then
        self.x = self.x + self.speed * dt
    end
    if love.keyboard.isScancodeDown('w', 'up') then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isScancodeDown('s', 'down') then
        self.y = self.y + self.speed * dt
    end
end

function Player:draw()
    love.graphics.circle('fill', self.x, self.y, 20)
end

return Player