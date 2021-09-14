String.prototype.replaceAll = function(search, replacement) {
  var target = this
  return target.replace(new RegExp(search, 'g'), replacement)
}

function encode(str) {
  return str.replaceAll('-', 'a').replaceAll(' ', 'b')
}

function pad(str) {
  if (str.length < 5) {
    return pad(` ${str}`)
  }
  return str
}

function genLine(fn, a, b) {
  const output = fn(a, b)
  const padded = pad(output.substring(0, 5))
  let dp = '0';
  const dpIndex = padded.indexOf('.')
  if (dpIndex != -1) {
    dp = (1 << (4 - dpIndex)).toString(16)
  }
  const numbers = pad(padded.replaceAll('\\.', '')).substring(1, 5)
  const encoded = dp + encode(numbers)
  console.log(encoded, padded)
}

function gen(fn) {
  for (let a = 0; a < 16; a++) {
    for (let b = 0; b < 16; b++) {
      genLine(fn, a, b)
    }
  }
}

function add(a, b) {
  return `${a + b}`
}

function sub(a, b) {
  return `${a - b}`
}

function mul(a, b) {
  return `${a * b}`
}

function div(a, b) {
  if (b === 0) {
    return '-'
  }
  return (a / b).toLocaleString('en-US', {
    maximumFractionDigits: 3,
  })
}

gen(add)
gen(sub)
gen(mul)
gen(div)
