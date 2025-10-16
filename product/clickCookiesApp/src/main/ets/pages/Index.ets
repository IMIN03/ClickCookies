import {Workshop,MemoryData, DeviceViewModel} from 'workshop'
import {Shop} from 'shop'
import {ConstStr,ConstUrl, DeviceModel} from 'utils'
import {TabBarBuilder} from '../builders/Builders'
import { MemoryModel, MemoryModelData } from 'workshop/src/main/ets/model/MemoryModel'
import { promptAction, PromptAction } from '@kit.ArkUI'

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
            playerListAdd:(device:DeviceModel,buyNum:number)=>{
              PlayerListAdd(device,buyNum,
                this.getUIContext().getPromptAction(),
                this.playerList,this.totalCookies,
                (newNum)=>{
                  this.totalCookies -= newNum
                  MemoryData.getInstance().totalCookies = this.totalCookies
                })},

            playerListSort:()=>{PlayerListSort(this.playerList)}
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

function PlayerListAdd(device:DeviceModel,buyNum:number,Prompt:PromptAction,playerList:DeviceViewModel[],currentCookies:number,setCookies:(newNum:number)=>void){

  let temp = playerList
  let idx = -1
  let newDevice = new DeviceViewModel(device,buyNum)
  idx = temp.findIndex((dev)=>{
    if(newDevice.name == dev.name)
      return true
    return false
  })

  //扣除
  if(currentCookies - newDevice.count * device.price >= 0) {
    setCookies(newDevice.count * device.price)
  }else {
    Prompt.showToast({
      message: "Cookie 不足",
      duration: 2000,
      showMode: promptAction.ToastShowMode.TOP_MOST,
      bottom: 85
    })
    return
  }

  if( idx  != -1 ){
      temp[idx].count += newDevice.count
  }else {
    temp.push(newDevice)
  }

  playerList = temp

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
  return true
}

function PlayerListSort(playerList:DeviceViewModel[]){
  playerList.sort((a:DeviceViewModel,b:DeviceViewModel)=>{
    return a.psc - b.psc
  })
}