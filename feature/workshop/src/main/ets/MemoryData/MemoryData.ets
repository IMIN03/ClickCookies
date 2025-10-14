import { DeviceViewModel } from "../../../../Index"
import { DeviceModel } from "utils/src/main/ets/model/DeviceModel"
import { MemoryModel } from "../model/MemoryModel"

//TODO  创建运行时数据示例，传入Index中
export class MemoryData{
  private _memoryPlayerList: MemoryModel[] = []

  private _totalCookies: number = 0

  private clickLevel:number = 1
  private cookiesPerClick:number = 0

  private static instance:MemoryData
  constructor() {}

  public static getInstance(){
    if (!MemoryData.instance){
      MemoryData.instance = new MemoryData()
    }
    return MemoryData.instance
  }

  public set totalCookies(value: number) {
    this._totalCookies = value
  }

  public get totalCookies(): number {
    return this._totalCookies
  }

  public set memoryPlayerList(value: MemoryModel[]) {
    this._memoryPlayerList = value
  }

  public get memoryPlayerList(): MemoryModel[] {
    return this._memoryPlayerList
  }

  //内存类型转到状态类型
  public memoryTo(memoryModelArray: MemoryModel[]) {
      const tempArray:DeviceViewModel[] = []

      memoryModelArray.forEach((value:MemoryModel,index:number)=>{
        let temp:DeviceViewModel = new DeviceViewModel(new DeviceModel(),1)
        temp.name = value.name
        temp.icon = value.icon
        temp.psc = value.psc
        temp.description = value.description
        temp.count = value.count
        tempArray.push(temp)
      })
      return tempArray
  }

}