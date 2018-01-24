module.exports = class List {
  constructor(initArr) {
    this.first = null
    this.last = null
    this.appendArray(initArr || [])
    this.values = this.getValues()
  }

  appendArray(array) {
    // console.log('appendArray array****', array)
    array.forEach(item => {
      let node = new Node({
        value: item,
        // previous: this.last
      })
      // console.log('CREATES NODE*********', node)
      //
      const oldLast = this.last
      if (oldLast) {
        oldLast.next = node
      }
      this.last = node
      if (!this.first) { this.first = node }
      //
    })
    // console.log('this.values*******', this.values.length)
    // console.log('this.last*******', this.last)
    // console.log('this.first*******', this.first)
    this.values = this.getValues()
    return this
  }

  append(list) {
    // console.log('append list****', list.values.length)

    let tmpNode = list.first
    while(tmpNode) {
      let node = new Node({
        value: tmpNode.value,
        // previous: this.last
      })
      //
      const oldLast = this.last
      if (oldLast) {
        oldLast.next = node
      }
      this.last = node
      if (!this.first) { this.first = node}
      //
      tmpNode = tmpNode.next
    }

    return this
  }

  concat(list) {
    return this.append(list)
  }

  filter(func) {
    const nodes = this.getNodes({ filterFn: func })
    // console.log('filtered values', nodes.map(node => node.value))
    return new List(nodes.map(node => node.value))
  }

  map(func) {
    let tmp = this.first
    let result = []
    while (tmp) {
      result.push(func(tmp.value))
      tmp = tmp.next
    }
    // console.log('MAP******', result)
    return new List(result)
  }

  getValues() {
    let tmp = this.first
    let result = []
    while (tmp) {
      result.push(tmp.value)
      tmp = tmp.next
    }
    return result
  }

  foldl(foldFn, num) {
    return this.values.reduce(foldFn, num)
  }

  foldr(foldFn, num) {
    return this.values.reverse().reduce(foldFn, num)
  }

  reverse() {
    return new List(this.values.reverse())
  }

  getNodes ({ filterFn } = {}) {
    // debugger
    // console.log('.getNode()*********', this.first, this.first.next, this.first.next.next)
    let tmp = this.first
    let result = []
    while (tmp) {
      if (filterFn && !filterFn(tmp.value)) {
        tmp = tmp.next
        continue;
      }
      result.push(tmp)
      tmp = tmp.next
    }
    // console.log('RESULT******', result)
    return result
  }
  length () {
    return this.getNodes().length
  }
}

class Node {
  constructor({value, next, previous}) {
    this.value = value
    this.next = next
    this.previous = previous
  }
}