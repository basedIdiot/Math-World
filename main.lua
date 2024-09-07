local Player = require 'Player'
local NPC = require 'NPC'
local QuestionManager = require 'Question'
local DialogManager   = require 'DialogManager'

-- Haiiii justin please send help


function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    player = Player.new(0, 0)
    plusSignNPC = NPC.new(100, 200)
    dialogManager = DialogManager.new()
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
    plusSignNPC:draw()
    love.graphics.setColor(0, 0, 0)
    QuestionManager.draw()
    love.graphics.setColor(1, 1, 1)

    dialogManager:draw()
end