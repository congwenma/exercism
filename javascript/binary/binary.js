module.exports = class Binary {
  constructor(str) {
    this.binary = str
  }
  static get ACCEPTED_VALUE() { return /^[01]*$/ }

  toDecimal() {
    if (!this.constructor.ACCEPTED_VALUE.test(this.binary)) {
      return 0;
    }
    return this.binary.split('').reverse().reduce((sum, digit, index) => {
      sum = sum + (+digit) * (2 ** index)
      return sum
    }, 0)
  }
}