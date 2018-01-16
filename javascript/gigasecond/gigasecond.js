module.exports = class Gigasecond {
  constructor(time) {
    this.time = time
  }

  date() {
    const anniversary = (+this.time) + 10E11
    return new Date(anniversary)
  }
}