module.exports = class Matrix {
  constructor(matrixString) {
    this.matrix = matrixString.split('\n')
      .map(row => row.split(' ').map(coord => +coord));
  }

  get rows() {
    return this.matrix
  }

  get columns() {
    return this.matrix[0].map(
      (coord, colIndex) => this.matrix.map(row => row[colIndex])
    )
  }
}