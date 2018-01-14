module.exports = class Bob {
  hey(str) {
    if (str.trim() === '') {
      return 'Fine. Be that way!'
    }
    else if (/[a-zA-Z]/.test(str) && str === str.toUpperCase()) {
      return 'Whoa, chill out!'
    }
    else if (/\?\s*$/.test(str)) {
      return 'Sure.'
    }
    else {
      return 'Whatever.'
    }
  }
}