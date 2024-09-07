local QuestionManager = {}

local utf8 = require("utf8")

local isAskingQuestion = false
currentQuestion = ''
currentAnswer = ''
local correctAnswer


love.keyboard.setTextInput(false)
function QuestionManager.askQuestion(question, answers)
    love.keyboard.setTextInput(true)
    isAskingQuestion = true
    currentQuestion = question
    correctAnswer = answers
end
function QuestionManager.answerQuestion()
    love.keyboard.setTextInput(false)
    isAskingQuestion = false
    for _, correctAnswer in ipairs(correctAnswer) do
        if string.lower(currentAnswer) == correctAnswer then
            return true
        end
    end
    return false
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