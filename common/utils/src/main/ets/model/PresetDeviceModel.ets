import { ConstStr } from '../ConstStr'

// 定义设备数据接口，与DeviceModel结构一致
export interface DeviceData {
  name: string
  icon: string
  psc: number
  description: string
  price:number
}

export class PresetDeviceData {
  // 使用Map存储设备数据，key为设备名称，value为设备数据
  private static readonly deviceDataMap: Map<string, DeviceData> = new Map<string, DeviceData>([
    [ConstStr.DEVICE_CURSOR, { name: ConstStr.DEVICE_CURSOR, icon: "app.media.cursor_icon", psc: 0.1, description: "最基础的点击设备，每秒产出0.1个饼干", price: 10 }],
    [ConstStr.DEVICE_GRANDMA, { name: ConstStr.DEVICE_GRANDMA, icon: "app.media.grandma_icon", psc: 1, description: "慈祥的奶奶会帮你烘焙饼干，每秒产出1个饼干", price: 100 }],
    [ConstStr.DEVICE_FARM, { name: ConstStr.DEVICE_FARM, icon: "app.media.farm_icon", psc: 8, description: "种植小麦和其他原料，每秒产出8个饼干", price: 800 }],
    [ConstStr.DEVICE_MINE, { name: ConstStr.DEVICE_MINE, icon: "app.media.mine_icon", psc: 47, description: "挖掘糖和其他甜味剂，每秒产出47个饼干", price: 4700 }],
    [ConstStr.DEVICE_FACTORY, { name: ConstStr.DEVICE_FACTORY, icon: "app.media.factory_icon", psc: 260, description: "大规模生产饼干，每秒产出260个饼干", price: 26000 }],
    [ConstStr.DEVICE_BANK, { name: ConstStr.DEVICE_BANK, icon: "app.media.bank_icon", psc: 1400, description: "通过投资获得饼干收益，每秒产出1400个饼干", price: 140000 }],
    [ConstStr.DEVICE_TEMPLE, { name: ConstStr.DEVICE_TEMPLE, icon: "app.media.temple_icon", psc: 7800, description: "神圣的力量加持饼干生产，每秒产出7800个饼干", price: 780000 }],
    [ConstStr.DEVICE_WIZARD_TOWER, { name: ConstStr.DEVICE_WIZARD_TOWER, icon: "app.media.wizard_tower_icon", psc: 44000, description: "魔法力量召唤饼干，每秒产出44000个饼干", price: 4400000 }],
    [ConstStr.DEVICE_SPACESHIP, { name: ConstStr.DEVICE_SPACESHIP, icon: "app.media.spaceship_icon", psc: 260000, description: "从外太空运输饼干，每秒产出260000个饼干", price: 26000000 }],
    [ConstStr.DEVICE_ALCHEMY_LAB, { name: ConstStr.DEVICE_ALCHEMY_LAB, icon: "app.media.alchemy_lab_icon", psc: 1600000, description: "将普通材料转化为饼干，每秒产出1600000个饼干", price: 160000000 }],
    [ConstStr.DEVICE_PORTAL, { name: ConstStr.DEVICE_PORTAL, icon: "app.media.portal_icon", psc: 10000000, description: "从异次元获取饼干，每秒产出10000000个饼干", price: 1000000000 }],
    [ConstStr.DEVICE_TIME_MACHINE, { name: ConstStr.DEVICE_TIME_MACHINE, icon: "app.media.time_machine_icon", psc: 65000000, description: "从过去和未来带回饼干，每秒产出65000000个饼干", price: 6500000000 }],
    [ConstStr.DEVICE_ANTIMATTER_CONDENSER, { name: ConstStr.DEVICE_ANTIMATTER_CONDENSER, icon: "app.media.antimatter_condenser_icon", psc: 430000000, description: "利用反物质能量生产饼干，每秒产出430000000个饼干", price: 43000000000 }],
    [ConstStr.DEVICE_PRISM, { name: ConstStr.DEVICE_PRISM, icon: "app.media.prism_icon", psc: 2900000000, description: "将光转化为饼干，每秒产出2900000000个饼干", price: 290000000000 }],
    [ConstStr.DEVICE_CHANCEMAKER, { name: ConstStr.DEVICE_CHANCEMAKER, icon: "app.media.chancemaker_icon", psc: 21000000000, description: "操控概率产生饼干，每秒产出21000000000个饼干", price: 2100000000000 }]
  ])


  public static getDeviceData(deviceName: string): DeviceData | null {
    return PresetDeviceData.deviceDataMap.get(deviceName) || null
  }

  public static getAllDeviceData(): DeviceData[] {
    return Array.from(PresetDeviceData.deviceDataMap.values())
  }

  public static hasDevice(deviceName: string): boolean {
    return PresetDeviceData.deviceDataMap.has(deviceName)
  }

}