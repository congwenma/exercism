const ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.split('')
module.exports = class Pangram {
  constructor(str) {
    this.str = str.toLowerCase()
  }
  isPangram() {
    return !!this.str && ALPHABET.every(
      letter => this.str.includes(letter)
    )
  }
}