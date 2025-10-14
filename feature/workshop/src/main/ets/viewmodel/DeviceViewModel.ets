import { DeviceModel } from "utils"

@ObservedV2
export class DeviceViewModel {
  @Trace name: string = 'null'
  @Trace icon: string = ''
  @Trace psc: number = 0
  @Trace description: string = '123'
  @Trace count: number = 0

  constructor(device:DeviceModel,c:number) {
    this.name = device.name
    this.icon = device.icon
    this.psc = device.psc
    this.description = device.description
    this.count = c
  }

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