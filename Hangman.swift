class Hangman {
    let names = ["ana", "aline", "bianca", "bruno", "carlos", "danilo"]
    var tries = 5
    var availableLetters = "abcdefghijklmnopqrstuvwyxz"
    var lettersGuessed = ""

    public func chooseName() -> String {
        let idx = Int.random(in: 0..<names.count)
        return names[idx]
    }

    public func guessWord() -> String {
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

    public func isLetterInWord(guess: String, name: String) -> Bool {
        return name.contains(Character(guess))
    }

    public func updateAvailableLetters() -> String {
        var letters = ""
        for letter in availableLetters {
            if !lettersGuessed.contains(letter) {
                letters += String(letter)
            }
        }
        
        return letters
    }

    // TODO give it a better name
    public func secretWord(name: String) {
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

    public func didIWin(name: String) -> Bool {
        for letter in name {
            if !lettersGuessed.contains(letter) {
                return false
            }
        }

        return true
    }
}
