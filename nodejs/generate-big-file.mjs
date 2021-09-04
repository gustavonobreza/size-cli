import { writeFileSync } from 'fs'
import { pseudoRandomBytes } from 'crypto'

// 1e9 = 1 000 000 000 bytes = 1 GB
writeFileSync("big.txt", pseudoRandomBytes(1e9), { flag: 'a' })