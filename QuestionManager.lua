local QuestionManager = {}

local utf8 = require("utf8")

local dialogManager = require 'DialogManager'

local isAskingQuestion = false
local currentAnswer = ''
local currentQuestion = ''
local rightResponse =  ''
local wrongResponse = ''
local correctAnswers = {}

love.keyboard.setTextInput(false)

function QuestionManager.askQuestion(question, answers, right, wrong)
    love.keyboard.setTextInput(true)
    isAskingQuestion = true
    correctAnswers = answers
    currentQuestion = question
    rightResponse = right
    wrongResponse = wrong
    dialogManager.isSkippingEnabled = false
    dialogManager:displayText(currentQuestion)
end
function QuestionManager.answerQuestion()
    for _, correctAnswer in ipairs(correctAnswers) do
        if string.lower(currentAnswer) == correctAnswer then
            print("graaa")
            dialogManager:forceDisplayText(rightResponse)
            QuestionManager.clearQuestion()

            return true
        end
    end
    print("bruu")
    dialogManager:forceDisplayText(wrongResponse, currentQuestion)
    --dialogManager:advance()
end
function QuestionManager.clearQuestion()
    love.keyboard.setTextInput(false)
    isAskingQuestion = false
    currentAnswer = ''
    currentQuestion = ''
    correctAnswers = {}
    rightResponse = ''
    wrongResponse = ''
end
function QuestionManager.keypressed(key)
    if not isAskingQuestion then return end
    if key == 'backspace' then
        -- get the byte offset to the last UTF-8 character in the string.
        -- remove the last UTF-8 character.
        -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
        QuestionManager.setCurrentAnswer(string.sub(currentAnswer, 1, #currentAnswer - 1))
    end
    if key == 'return' then
        QuestionManager.answerQuestion()
    end
end
function QuestionManager.draw()
    love.graphics.print(currentAnswer, 100, 100)
end
function QuestionManager.setCurrentAnswer(answer)
    currentAnswer = answer
end
function love.textinput(t)
    QuestionManager.setCurrentAnswer(currentAnswer .. t)
end
return QuestionManager