// doubly linked list
// need array like methods `push, pop, shift, unshift`


module.exports = class LinkedList  {
  constructor() {
    this.firstNode = null
    this.lastNode = null
  }

  push(val) {
    const node = new Node(val, this.lastNode)
    const oldLastNode = this.lastNode
    if (oldLastNode) {
      oldLastNode.next = node
    }
    else {
      this.firstNode = node
    }
    this.lastNode = node
  }

  unshift(val) {
    const node = new Node(val, null, this.firstNode)
    const oldFirstNode = this.firstNode
    if (oldFirstNode) {
      oldFirstNode.previous = node
    }
    else {
      this.lastNode = node
    }
    this.firstNode = node
  }

  pop() {
    const last = this.lastNode
    const newLast = last && last.previous
    if (newLast) {
      this.lastNode = newLast
      newLast.next = undefined
    }
    else {
      this.lastNode = undefined
    }
    return last.value
  }

  shift() {
    // debugger;
    const first = this.firstNode
    const newFirst = first && first.next
    if (newFirst) {
      this.firstNode = newFirst
      newFirst.previous = undefined
    }
    else {
      this.firstNode = undefined
    }
    return first.value
  }

  count() {
    var ref = this.firstNode
    let count = 0
    while(ref) {
      count += 1
      ref = ref.next
    }
    return count
  }

  delete(val) {
    var ref = this.firstNode
    while (ref) {
      if (ref.value === val) {
        const previous = ref.previous
        const next = ref.next
        if (previous) {
          previous.next = next
        }
        if (next) {
          next.previous = previous
        }
        if(!previous) {
          this.firstNode = next
        }
        if(!next) {
          this.lastNode = previous
        }
      }
      ref = ref.next
    }
  }
}

class Node {
  constructor(val, prev, next) {
    this.value = val
    this.previous = prev
    this.next = next
  }
}