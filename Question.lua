local Question = {}
Question.__index = Question

local dialogManager = require 'DialogManager'

local activeQuestion

function Question.new(question, answers, right, wrong)
    local self = {
        active = false,
        question = question,
        answers = answers,
        rightResponse = right,
        wrongResponse = wrong,
        currentAnswer = ''
    }
    return setmetatable(self, Question)
end
function Question:askQuestion()
    love.keyboard.setTextInput(true)
    dialogManager.isSkippingEnabled = false
    dialogManager:displayText(currentQuestion)
end
function Question:answerQuestion()
    for _, correctAnswer in ipairs(correctAnswers) do
        if string.lower(currentAnswer) == correctAnswer then
            print("graaa")
            dialogManager:forceDisplayText(rightResponse)
            self:endQuestion()
            return true
        end
    end
    print("bruu")
    dialogManager:forceDisplayText(wrongResponse, currentQuestion)
    --dialogManager:advance()
end
function Question:endQuestion()
    love.keyboard.setTextInput(false)
    dialogManager.isSkippingEnabled = true
end
function Question:keypressed(key)
    if not isAskingQuestion then return end
    if key == 'backspace' then
        self.currentAnswer = string.sub(currentAnswer, 1, #self.currentAnswer - 1)
        -- get the byte offset to the last UTF-8 character in the string.
        -- remove the last UTF-8 character.
        -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
    end
    if key == 'return' then
        self:answerQuestion()
    end
end

return Question