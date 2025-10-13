@ObservedV2
export class DeviceViewModel {
  @Trace name: string = 'null'
  @Trace icon: string = ''
  @Trace psc: number = 0
  @Trace description: string = '123'
  @Trace count: number = 0

  // constructor(name: string , icon: string, psc: number, description: string, count: number) {
  //   this.name = name
  //   this.icon = icon
  //   this.psc = psc
  //   this.description = description
  //   this.count = count
  // }


  getTotalOutput(): number {
    return isNaN(this.psc) ? 0 : this.psc * this.count
  }

  getFormattedOutput(): string {
    const total = this.getTotalOutput()
    if (total >= 1e12) return (total / 1e12).toFixed(1) + 'T/s'
    if (total >= 1e9) return (total / 1e9).toFixed(1) + 'B/s'
    if (total >= 1e6) return (total / 1e6).toFixed(1) + 'M/s'
    if (total >= 1e3) return (total / 1e3).toFixed(1) + 'K/s'
    return total.toString() + '/s'
  }
}