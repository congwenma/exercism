const RATIOS = {
  Mercury: 0.2408467,
  Venus: 0.61519726,
  Mars: 1.8808158,
  Jupiter: 11.862615,
  Saturn: 29.447498,
  Uranus: 84.016846,
  Neptune: 164.79132,
}

class SpaceAge {
  constructor(age) {
    this.seconds = age
  }

  onEarth() {
    return +(this.seconds / 31557600).toFixed(2)
  }
}

Object.keys(RATIOS).forEach(key => {
  const value = RATIOS[key]
  Object.assign(SpaceAge.prototype, {
    [`on${key}`]: function () {
      return +(this.seconds / 31557600 / value).toFixed(2)
    }
  })
})

console.log(Object.keys(SpaceAge.prototype))

module.exports = SpaceAge