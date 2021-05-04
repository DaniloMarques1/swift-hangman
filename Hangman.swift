class Hangman {
    let names = ["ana", "aline", "bianca", "bruno", "carlos", "danilo"] 
    var tries = 5
    var availableLetters = "abcdefghijklmnopqrstuvwyxz"
    var lettersGuessed = ""

    private func chooseName() -> String {
        let idx = Int.random(in: 0..<names.count)
        return names[idx]
    }

    private func guessWord() -> String {
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

    private func isLetterInWord(guess: String, name: String) -> Bool {
        return name.contains(Character(guess))
    }

    private func updateAvailableLetters() -> String {
        var letters = ""
        for letter in availableLetters {
            if !lettersGuessed.contains(letter) {
                letters += String(letter)
            }
        }
        
        return letters
    }

    // TODO give it a better name
    private func secretWord(name: String) {
        var secret = ""
        for letter in name {
            if !lettersGuessed.contains(letter) {
                secret += "_"
            } else {
                secret += String(letter)
            }

        }

        print(secret)
    }

    private func didIWin(name: String) -> Bool {
        return lettersGuessed.elementsEqual(name)
    }

    func start() -> Void {
        let name = chooseName()
        while tries > 0 {
            let guess = guessWord()
            if isLetterInWord(guess: guess, name: name) {
                //lettersGuessed.append(guess)
                lettersGuessed += guess
                availableLetters = updateAvailableLetters()
                if didIWin(name: name) {
                    print("You won!!!")
                    break
                }
                print("Good guess! still have \(tries) tries")
            } else {
                tries -= 1
                print("Oops, that letter is not in my word! You still have \(tries) tries")
            }

            secretWord(name: name)
            print()
        }

        if tries == 0 {
            print("You lost :( no worries, you can always try again!")
        }
    }

}
