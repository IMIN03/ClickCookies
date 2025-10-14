export interface MemoryModelData {
  name?: string
  icon?: string
  psc?: number
  description?: string
  count?: number
}

export class MemoryModel{
  name:string = 'null'
  icon:string = ''
  psc:number = 0
  description:string = 'null'
  count:number = 0

  static fromJSON(data: MemoryModelData): MemoryModel {
    const model = new MemoryModel()
    model.name = data.name ?? 'null'
    model.icon = data.icon ?? ''
    model.psc = data.psc ?? 0
    model.description = data.description ?? 'null'
    model.count = data.count ?? 0
    return model
  }

  // 添加批量转换方法
  static fromJSONArray(dataArray: MemoryModelData[]): MemoryModel[] {
    return dataArray.map(data => MemoryModel.fromJSON(data))
  }
}



