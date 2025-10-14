import {Workshop,MemoryData, DeviceViewModel} from 'workshop'
import {Shop} from 'shop'
import {ConstStr,ConstUrl, DeviceModel} from 'utils'
import {TabBarBuilder} from '../builders/Builders'
import { MemoryModel, MemoryModelData } from 'workshop/src/main/ets/model/MemoryModel'

const TAG = 'qwq - product_index'

@Entry
@ComponentV2
struct Index {

  @Local playerList:DeviceViewModel[] = []
  @Local totalCookies: number = 0
  @Local clickLevel: number = 1
  @Local cookiesPerClick: number = 1

  aboutToAppear() {
    const memoryData = MemoryData.getInstance()

    this.totalCookies = memoryData.totalCookies
    this.playerList = memoryData.memoryTo(memoryData.memoryPlayerList)
  }

  build() {
    Column(){
      Tabs(){
        TabContent(){
          Workshop({
            totalCookies:this.totalCookies,
            playerDeviceList:this.playerList,

            totalCookiesAdd:(num:number)=>{
              this.totalCookies += num
              MemoryData.getInstance().totalCookies = this.totalCookies
            }
          })
        }.tabBar(TabBarBuilder(ConstUrl.WORKSHOP_TABBUILDER_ICON,ConstStr.WORKSHOP))

        TabContent(){
          Shop({
            playerListAdd:(device:DeviceModel)=>{
              let temp = this.playerList
              let idx = -1
              let newDevice = new DeviceViewModel(device,1)
              idx = temp.findIndex((dev)=>{
                if(newDevice.name == dev.name)
                  return true
                return false
              })
              if( idx  != -1 ){
                temp[idx].count += newDevice.count
              }else {
                temp.push(newDevice)
              }

              this.playerList = temp

              //MemoryData.getInstance().memoryPlayerList = temp

              const cleanMemoryList:MemoryModel[] = temp.map(item => {
                const memoryModel = new MemoryModel()
                memoryModel.name = item.name
                memoryModel.icon = item.icon
                memoryModel.psc = item.psc
                memoryModel.description = item.description
                memoryModel.count = item.count
                return memoryModel
              })
              MemoryData.getInstance().memoryPlayerList = cleanMemoryList

            }
          })
        }.tabBar(TabBarBuilder(ConstUrl.SHOP_TABBUILDER_ICON,ConstStr.SHOP))


        TabContent(){
          //Accident()
        }.tabBar(TabBarBuilder(ConstUrl.ACCIDENT_TABBUILDER_ICON,ConstStr.ACCIDENT))


        TabContent(){
          //SkillTree()
        }.tabBar(TabBarBuilder(ConstUrl.SKILLTREE_TABBUILDER_ICON,ConstStr.SKILLTREE))
      }
      .divider({strokeWidth:1})
      .barPosition(BarPosition.End)
      .scrollable(false)
    }
  }
}