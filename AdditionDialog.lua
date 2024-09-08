-- First element in array is question, subsequent elements are possible answers
local additionDialog = {
    '[Addition]: You don’t remember me? I will help you!',
    '[Addition]: When you need to put more than one number together, you add!',
    '[Addition]: See, there is 1 of me! And 1 of you! If we add us together, then there’s 2 of us.',
    '[Addition]: That is the sum. The result from adding the numbers is called a sum.',
    '[Addition]: This is the symbol for addition: “+”. You say it like “plus.” This symbol is called a plus sign.',
    '[Addition]: Look here! I have ooo! If I get another two oo, how much do I have right now? Help me count!',
    '[Addition]: ooooo right? So to do that with our “+” and numbers, it is 3 + 2. Which means the sum is 5!',

    '[Addition]: Now, for some practice.',
    {
        question = "[Addition]: I have two piles of apples. A pile has one · apple (who said piles must have multiple things?). The other pile has two ·· apples. If I put the two piles together, how many apples does the new pile have?", 
        answers = {"three", "3"},
        rightResponse = "[Addition]: Nice work. Remember your counting, and it will take you rather far.",
        wrongResponse = "[Addition]: Hmmm. Try again. Remember your counting!"
    },
    {
        question = "[Addition]: Ok, same pile of apples from the last question. If I add an empty pile of apples, how many apples with the new pile have?", 
        answers = {"zero", "0", "00"},
        rightResponse = "[Addition]: Of course! That's what adding zero (or nothing) does! Some people didn't like zero too much, but they're zero (heh) now.",
        wrongResponse = "[Addition]: Hmmm. What happens to the number of apples if I do nothing to the pile?"
    },
}

return additionDialog