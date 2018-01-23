const rand = n => Math.floor(Math.random() * n)
const ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase()
let abCounter = 0 // 'AA'
let numCounter = 0 // '0000'
module.exports = class Robot {
  constructor() {
    this.name = this.generateNewName()
  }

  generateNewName() {
    const firstLetter = Math.floor(abCounter / 26)
    const secondLetter = abCounter % 26
    // console.log('second letter', firstLetter, secondLetter)
    // console.log('second letter', ALPHABET[firstLetter], ALPHABET[secondLetter] )
    const result = [
      ALPHABET[firstLetter],
      ALPHABET[secondLetter],
      numCounter.toString().padStart(3).replace(/ /g, '0')
    ].join('')

    numCounter += 1
    if (numCounter === 1000) {
      numCounter = 1
      abCounter += 1
    }
    return result;
  }

  usedName() {
    return [
    ]
  }

  reset() {
    this.name = this.generateNewName()
  }
}