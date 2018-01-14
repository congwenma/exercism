const expand = n => [...Array(n)]
module.exports = class Cipher {
  constructor(key) {
    if (/[A-Z0-9]/.test(key) || key === '') {
      throw new Error('Bad key')
    }
    this.key = key || 'aaaaaaaaaaaaaaaaaaaaa'
  }

  encode(str) {
    this.ensureEnoughKeyLength(str)

    return str.split('').map(
      letter => letter.charCodeAt(0)
    ).map(
      (charCode, index) => {
        return String.fromCharCode(
          (charCode + (
            this.key.charCodeAt(index) - 97
          ) - 97) % 26 + 97
        )
      }
    ).join('')
  }

  ensureEnoughKeyLength(str) {
    const multiple = Math.ceil(
      str.length / this.key.length
    )
    this.key = expand(multiple).reduce(
      accu => accu + this.key, ""
    )
  }

  decode(str) {
    this.ensureEnoughKeyLength(str)

    return str.split('').map(
      letter => letter.charCodeAt(0)
    ).map(
      (charCode, index) => {
        return String.fromCharCode(
          (charCode - (
            this.key.charCodeAt(index) - 97
          ) - 97 + 26) % 26 + 97
        )
      }
    ).join('')
  }
}