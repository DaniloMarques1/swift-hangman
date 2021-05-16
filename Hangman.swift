class Hangman {
    let names = ["ana", "aline", "bianca", "bruno", "carlos", "danilo"]
    var tries = 5
    var availableLetters = "abcdefghijklmnopqrstuvwyxz"
    var lettersGuessed = ""

    public func randomName() -> String {
        let idx = Int.random(in: 0..<names.count)
        return names[idx]
    }

    public func isGuessCorrect(guess: String, name: String) -> Bool {
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

    public func secretWord(name: String) -> String {
        var secret = ""
        for letter in name {
            if !lettersGuessed.contains(letter) {
                secret += "_"
            } else {
                secret += String(letter)
            }

        }

        return secret
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
