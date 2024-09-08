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
end
function Question:answerQuestion()
    for _, correctAnswer in ipairs(self.answers) do
        if string.lower(self.currentAnswer) == correctAnswer then
            table.remove(dialogManager.textSequence, 1) --Need to remove question from queue because reasons
            dialogManager:forceDisplayText(self.rightResponse)
            self:endQuestion()
            return true
        end
    end
    dialogManager:forceDisplayText(self.wrongResponse, self.question)
    --dialogManager:advance()
end
function Question:endQuestion()
    love.keyboard.setTextInput(false)
    dialogManager.isSkippingEnabled = true
end
function Question:keypressed(key)
    if key == 'backspace' then
        self.currentAnswer = string.sub(self.currentAnswer, 1, #self.currentAnswer - 1)
        -- get the byte offset to the last UTF-8 character in the string.
        -- remove the last UTF-8 character.
        -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
    end
    if key == 'return' then
        self:answerQuestion()
    end
end

return Question