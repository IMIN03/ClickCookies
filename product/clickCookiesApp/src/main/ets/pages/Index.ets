import {Workshop,MemoryData, DeviceViewModel} from 'workshop'
import {Shop} from 'shop'
import {ConstStr,ConstUrl, DeviceModel} from 'utils'
import {TabBarBuilder} from '../builders/Builders'

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
              console.info(TAG,`totalCookies: ${this.totalCookies}`)
            }
          })
        }.tabBar(TabBarBuilder(ConstUrl.WORKSHOP_TABBUILDER_ICON,ConstStr.WORKSHOP))

        TabContent(){
          Shop({


            playerListAdd:(device:DeviceModel)=>{
              let temp = this.playerList
              let idx = -1
              let newDevice = new DeviceViewModel(device,1)
              if( (idx = temp.findIndex((dev)=>{newDevice.name == dev.name})) != -1 ){
                temp[idx].count += newDevice.count
              }else {
                temp.push(newDevice)
              }
              this.playerList = temp
              console.info(TAG,`listLength:${this.playerList.length}`)
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