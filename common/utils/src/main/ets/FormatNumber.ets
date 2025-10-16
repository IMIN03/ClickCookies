export function formatNumber(value: number): string {
  const abs = Math.abs(value)
  if (abs < 1000) return `${value}`

  const units:Map<number,string> = new Map<number,string>([
    [ 1e12  , 'T' ],
    [ 1e9   , 'B' ],
    [ 1e6   , 'M' ],
    [ 1e3   , 'K' ],
  ])

  for (let i=1e12;i<units.size;i/=1e3) {
    if (abs >= i) {
      const num = value / i
      const fixed = num % 1 === 0 ? num.toFixed(0) : num.toFixed(1)
      console.info('qwq - format',`${fixed}${units.get(i)}`)
      return `${fixed}${units.get(i)}`
    }
  }

  return `${value}`
}