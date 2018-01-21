function isNumber(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}

const COMMANDS = {
  '0': 'wink',
  '1': 'double blink',
  '2': 'close your eyes',
  '3': 'jump'
}

module.exports = class SecretHandbrake {
  constructor(num) {
    if (!isNumber(num)) {
      throw new Error('Handshake must be a number')
    }
    this.binary = num.toString(2)
  }

  commands() {
    const reversedDigits = this.binary.split('').reverse()
    const result = reversedDigits.slice(0, 4).map(
      (digit, index) => {
        if(digit === '0') {
          return undefined
        }
        return COMMANDS[index]
      }
    ).filter(n => n)
    if (reversedDigits[4]) {
      result.reverse()
    }
    return result
  }
}