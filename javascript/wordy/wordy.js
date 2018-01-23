class ArgumentError extends Error {

}

const operate = (num1, num2, operator) => {
  switch(operator) {
    case 'plus':
      return num1 + num2
    case 'minus':
      return num1 - num2
    case 'multiplied by':
      return num1 * num2
    case 'divided by':
      return num1 / num2
  }
}

const PROBLEM_REGEX = /What is (-?\d*)([a-z ]+)(-?\d+)([a-z ]*)?(-?\d*)?\?/
module.exports = {
  WordProblem: class WordProblem {
    constructor(question) {
      this.question = question
    }

    answer() {
      const result = PROBLEM_REGEX.exec(this.question)
      console.log('result', result)
      if(result) {
        let [_, num1, operator1, num2, operator2, num3] = result
        num1 = +num1
        num2 = +num2
        num3 = +num3
        operator1 = operator1 && operator1.trim()
        operator2 = operator2 && operator2.trim()

        console.log('PARAMS*****', num1, num2, num3)
        console.log('RESULT*****', operate(num1, num2, operator1))

        let answer = operate(num1, num2, operator1)
        if (operator2) {
          answer = operate(answer, num3, operator2)
        }
        return answer
      }
      else {
        throw new ArgumentError()
      }
    }
  },
  ArgumentError
}