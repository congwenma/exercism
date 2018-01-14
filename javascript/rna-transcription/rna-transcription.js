const DICTIONARY = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
}

module.exports = class RnaTranscription {
  toRna(dnas) {
    return dnas.split('')
      .map(dna => {
        const rna = DICTIONARY[dna]
        if (!rna) {
          throw new Error('Invalid input')
        }
        return rna
      })
      .join('')
  }
}