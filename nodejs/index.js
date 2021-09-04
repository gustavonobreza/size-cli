const fs = require('fs')
// const { join } = require('path')
const { pseudoRandomBytes } = require('crypto')


// const stats = fs.statSync(join(process.cwd(), process.argv[2]), { throwIfNoEntry: true })

// console.log(stats.size + ' bytes');

fs.writeFileSync("big.txt", pseudoRandomBytes(1e10), { flag: 'a' })