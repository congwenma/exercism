module.exports = class School {
  constructor() {
    this.studentRoster = {}
  }

  add(name, num) {
    this.studentRoster[num] = this.studentRoster[num] || []
    this.studentRoster[num].push(name)
    this.studentRoster[num] = this.studentRoster[num].sort()
  }

  roster() {
    return this.studentRoster
  }

  grade(grade) {
    return this.studentRoster[grade] || []
  }
}