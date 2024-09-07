local Player = require 'Player'
local QuestionManager = require 'QuestionManager'
local DialogManager   = require 'DialogManager'

-- Haiiii justin please send help


function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    player = Player.new(0, 0)
    dialogManager = DialogManager.new()
    dialogManager:displayText('bruh', 'hehe')
    QuestionManager.askQuestion('bro', 'blud')
end

function love.update(dt)
    player:update(dt)
end

function love.keypressed(key, scancode)
    QuestionManager.keypressed(scancode)
    dialogManager:keypressed(scancode)
end

function love.draw()
    player:draw()
    love.graphics.setColor(0, 0, 0)
    QuestionManager.draw()
    love.graphics.setColor(1, 1, 1)

    dialogManager:draw()
end