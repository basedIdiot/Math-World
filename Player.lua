local anim8 = require 'vendor.anim8'
local images = require 'images'

local Player = {}
Player.__index = Player

function Player.new(x, y)
    local self = setmetatable({}, Player)
    self.x = x
    self.y = y
    self.speed = 150
    self.horizontalFlip = 1

    local animationGrid = anim8.newGrid(
        128, 128, images.player:getWidth(), images.player:getHeight()
    )
    self.animation = anim8.newAnimation(animationGrid('1-2',1), 0.1)
    return self
end

function Player:update(dt)
    local isAnimationPlaying = false
    if love.keyboard.isScancodeDown('a', 'left') then
        self.x = self.x - self.speed * dt
        isAnimationPlaying = true
        self.horizontalFlip = 1
    elseif love.keyboard.isScancodeDown('d', 'right') then
        self.x = self.x + self.speed * dt
        isAnimationPlaying = true
        self.horizontalFlip = -1
    end
    if love.keyboard.isScancodeDown('w', 'up') then
        self.y = self.y - self.speed * dt
        isAnimationPlaying = true
    elseif love.keyboard.isScancodeDown('s', 'down') then
        self.y = self.y + self.speed * dt
        isAnimationPlaying = true
    end

    if isAnimationPlaying then
        self.animation:update(dt)
    end
end

function Player:draw()
    self.animation:draw(images.player, self.x, self.y, 0, 0.5*self.horizontalFlip, 0.5, 64, 64)
end

return Player