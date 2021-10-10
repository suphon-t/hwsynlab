import 'zx/globals'
import path from 'path'

const filePath = process.argv[2]
const fullPath = path.resolve(filePath)
const dirName = path.dirname(fullPath)
const fileName = path.basename(fullPath)

cd(dirName)
const result = (await $`customasm ${fileName} -p -f hexstr`).stdout + ''
const instSize = 8
const lines = result.split('\n')
const program = lines[lines.length - 2]

const instructions = []

let rest = program
while (rest !== '') {
  const inst = rest.substring(0, instSize)
  instructions.push(inst)
  rest = rest.substring(instSize)
}

console.log('')
console.log('output:')
console.log(instructions.join(' '))
console.log('')
