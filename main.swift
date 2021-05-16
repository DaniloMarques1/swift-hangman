func start() -> Void {
    let hangman = Hangman()
    let name = hangman.randomName()
    while hangman.tries > 0 {
        let guess = guessWord()
        if hangman.isGuessCorrect(guess: guess, name: name) {
            hangman.lettersGuessed += guess
            hangman.availableLetters = hangman.updateAvailableLetters()
            if hangman.didIWin(name: name) {
                print("You won!!!")
                break
            }
            print("Good guess! still have \(hangman.tries) tries")
        } else {
            hangman.tries -= 1
            print("Oops, that letter is not in my word! You still have \(hangman.tries) tries")
        }

        // in gui we would update the text view
        print(hangman.secretWord(name: name))
        print()
    }

    if hangman.tries == 0 {
        print("You lost :( no worries, you can always try again! The correct name was \(name)")
    }
}

// in a gui would be a input
func guessWord() -> String {
        var guess = ""
        print("Enter a guess: \(availableLetters) ", terminator: "")
        while true {
            guess = readLine() ?? ""
            if guess.count == 1 {
                break
            }

            print("Please, type only one letter for your guess: ", terminator: "")
        }

        return guess
}

start()
