local QuestionManager = {}

local currentQuestion
local correctAnswer
local currentAnswer = ""
function QuestionManager.askQuestion(question, answer)
    local currentQuestion = question
    local correctAnswer = answer
end
function QuestionManager.answerQuestion()
    if string.lower(currentAnswer) == correctAnswer then
        return true
    end
    return false
end
function love.textinput(t)
    currentAnswer = currentAnswer .. t
end

function love.keypressed(key)
    if not currentQuestion then return end
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(text, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            text = string.sub(text, 1, byteoffset - 1)
        end
    end
    if key == "enter" then
        
    end
end
return QuestionManager