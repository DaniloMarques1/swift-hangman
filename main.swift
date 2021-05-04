func start() -> Void {
    let hangman = Hangman()
    let name = hangman.chooseName()
    while hangman.tries > 0 {
        let guess = hangman.guessWord()
        if hangman.isLetterInWord(guess: guess, name: name) {
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

        hangman.secretWord(name: name)
        print()
    }

    if hangman.tries == 0 {
        print("You lost :( no worries, you can always try again! The correct name was \(name)")
    }
}

start()
