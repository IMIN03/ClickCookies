// ... existing code ...
export function formatNumber(value: number): string {
  const abs = Math.abs(value)

  // ≤ 1000 时仅当有小数显示 1 位
  if (abs <= 1000) {
    const isInteger = Math.floor(abs) === abs
    const s = isInteger ? `${value}` : value.toFixed(1)
    return s.replace(/\.0$/, '')
  }

  // 单位表（按从大到小插入，确保迭代顺序）
  const units: Map<number, string> = new Map<number, string>([
    [1e12, 'T'],
    [1e9, 'B'],
    [1e6, 'M'],
    [1e3, 'K'],
  ])

  // 按基数从大到小判断是否落在 [base, base*10)
  for (let i = 1e12; i >= 1e3; i /= 1e3) {
    if (abs >= i && abs < i * 10) {
      const suffix = units.get(i) || ''
      const mantissa = Math.floor(abs / i) * (value < 0 ? -1 : 1)
      return `${mantissa}${suffix}`
    }
  }

  // 超过最高单位首十倍区间（例如 ≥ 10T）：输出整数部分
  return `${Math.trunc(value)}`
}
// ... existing code ...