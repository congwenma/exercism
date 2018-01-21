const expand = n => [...Array(n).keys()]

module.exports = class Triange {
  constructor(totalRows) {
    // setup
    this.memoize = {}


    this.totalRows = totalRows;
    this.rows = expand(totalRows)
      .map(index => this.generateRow(index+1))
  }

  get lastRow() {
    return this.memoize[this.totalRows]
  }

  generateRow(index) {
    let result
    if (index === 1) {
      result = [1]
    }
    else {
      const prevResult = this.memoize[index-1]
      result = expand(prevResult.length+1).map(
        index => {
          if (index === 0) {
            return prevResult[0]
          }
          else if (index === prevResult.length){
            return prevResult[index-1]
          }
          else {
            return prevResult[index-1] + prevResult[index]
          }
        }
      )
    }

    // console.warn(this.memoize, 'this.memoize')
    // console.warn(result, 'result')
    this.memoize[index] = result
    return result
  }
}
