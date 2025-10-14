import {DeviceModel, PresetDeviceData} from 'utils'

@ComponentV2
export struct Shop{
  @Local presetList:DeviceModel[] = []

  @Event playerListAdd: (device:DeviceModel) => void = () => {};

  aboutToAppear(): void {
    this.presetList = PresetDeviceData.getAllDeviceData()
    console.info('qwq - shop',`Preset Length:${this.presetList.length}`)
  }

  build() {
    Column(){
      Text('商店')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })
      
      // 使用List显示所有可购买的设备
      List({ space: 8 }) {
        ForEach(this.presetList, (device:DeviceModel, index:number) => {
          ListItem() {
            Row() {
              Column() {
                Text(device.name)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#333333')
                
                Text(device.description)
                  .fontSize(12)
                  .fontColor('#666666')
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .margin({ top: 4 })
                
                Text(`产出: ${device.psc}/秒`)
                  .fontSize(12)
                  .fontColor('#4CAF50')
                  .margin({ top: 4 })
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
              .padding({ left: 12 })
              
              Button('购买')
                .fontSize(14)
                .height(36)
                .width(80)
                .borderRadius(6)
                .backgroundColor('#4CAF50')
                .fontColor($r('sys.color.comp_background_list_card'))
                .onClick(() => {
                  console.info('qwq - shop', `购买设备[${index}]: ${this.presetList[index].name}, 产出: ${PresetDeviceData.getDeviceData(this.presetList[index].name)?.psc}`)

                  this.playerListAdd(PresetDeviceData.getDeviceData(this.presetList[index].name) as DeviceModel)

                })
            }
            .width('100%')
            .height(80)
            .backgroundColor($r('sys.color.comp_background_list_card'))
            .borderRadius(8)
            .padding({ left: 16, right: 16 })
            .border({
              width: 1,
              color: '#E0E0E0'
            })
          }
        })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}