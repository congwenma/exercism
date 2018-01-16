module.exports = {
  for: (num) => {
    const pfs = generatePrimeFactors(num, [])

    if (num === 1) {
      return []
    }
    else if (num === 2 || num === 3) {
      return [num]
    }
    return pfs
  }
}

const generatePrimeFactors = (num, accu) => {
  var pfs = []

  for (var i = 2; i < num; i++) {
    if (num % i === 0) {
      return generatePrimeFactors(num / i, [...accu, i])
    }
  }

  return [...accu, num];
}