local Player = require 'Player'
local NPC = require 'NPC'
local Question = require 'Question'
local QuestionManager = require 'QuestionManager'
local dialogManager   = require 'DialogManager'
local AdditionDialog  = require 'AdditionDialog'
local images          = require 'images'

-- Haiiii justin please send help

local npcs
-- Haiiii justin please send help
function handleDialog(dialogTable)
    for _, dialog in ipairs(dialogTable) do
        if type(dialog) == "table" then
            dialog = Question.new(dialog.question, dialog.answers, dialog.rightResponse, dialog.wrongResponse)
        end
        print(dialog.askQuestion)
        dialogManager:displayText(dialog)
    end
end

function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    npcs = {
        addition = NPC.new(100, 200, 64, images.addition, function()
            handleDialog(AdditionDialog)
        end),
        subtraction = NPC.new(250, 200, 64, images.subtraction, function()
            dialogManager:displayText("hehehe")
        end),
        division = NPC.new(400, 200, 64, images.division, function()
            dialogManager:displayText('bruh')
        end),
        multiplication = NPC.new(550, 200, 64, images.multiplication, function()
            dialogManager:displayText('bruh')
        end),
        mathSymbol = NPC.new(600, 600, 128, images.mathSymbol, function()
            dialogManager:displayText("be not afraid")
        end)
    }

    player = Player.new(0, 0, npcs)

    --dialogManager = DialogManager
end

function love.update(dt)
    player:update(dt)
    -- this code looks kinda bad, but dont worry abt it 
    player.isPaused = #dialogManager.textSequence > 0
end

function love.keypressed(key, scancode)
    QuestionManager.keypressed(scancode)
    dialogManager:keypressed(scancode)
    player:keypressed(scancode)
end
function love.textinput(t)
    dialogManager:textinput(t)
end

function love.draw()
    player:draw()
    for _, npc in pairs(npcs) do
        npc:draw()
    end
    love.graphics.setColor(0, 0, 0)
    QuestionManager.draw()
    love.graphics.setColor(1, 1, 1)

    dialogManager:draw()
end