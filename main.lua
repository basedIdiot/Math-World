local Player = require 'Player'
local NPC = require 'NPC'
local QuestionManager = require 'QuestionManager'
local dialogManager   = require 'DialogManager'
local AdditionDialog  = require 'AdditionDialog'

-- Haiiii justin please send help
function handleDialog(dialog)
    if type(dialog) == "string" then
        print(dialog)
        dialogManager.displayText(dialog)
    else
        print(dialog)
        dialogManager.displayText(dialog.question)
        QuestionManager.askQuestion(dialog.question, dialog.answers, dialog.rightResponse, dialog.wrongResponse)
    end
end

function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    player = Player.new(0, 0)
    plusSignNPC = NPC.new(100, 200)    

    for _, dialog in ipairs(AdditionDialog) do
        handleDialog(dialog)
    end
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