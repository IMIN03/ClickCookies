import {DeviceModel, PresetDeviceData,formatNumber} from 'utils'

@ComponentV2
export struct Shop{
  @Local presetList:DeviceModel[] = []

  @Event playerListAdd: (device:DeviceModel,buyNum:number) => void = () => {};
  @Event playerListSort: ()=>void = ()=>{}

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

      Grid() {
        ForEach(this.presetList, (device:DeviceModel, index:number) => {
          GridItem() {
            Column() {
              Text(device.name)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .margin({ bottom: 6 })

              Row() {
                Image($r(device.icon))
                  .width(56)
                  .height(56)
                  .objectFit(ImageFit.Contain)
              }
              .justifyContent(FlexAlign.Center)
              .margin({ bottom: 6 })

              Text(`价格: ${formatNumber(device.price)}`)
                .fontSize(13)
                .fontColor('#FF9800')
                .margin({ bottom: 8 })

              Row() {
                Button(){
                  Text('购买1个')
                    .fontSize(12)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .textAlign(TextAlign.Center)
                    .width('100%')
                }
                  .height(32)
                  .layoutWeight(1)
                  .backgroundColor('#4CAF50')
                  .fontColor($r('sys.color.comp_background_list_card'))
                  .borderRadius(6)
                  .onClick(() => {
                    this.playerListAdd(device,1)
                    this.playerListSort()
                  })

                Blank().width(8)

                Button(){
                  Text('购买10个')
                    .fontSize(12)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .textAlign(TextAlign.Center)
                    .width('100%')
                }
                  .height(32)
                  .layoutWeight(1)
                  .backgroundColor('#4CAF50')
                  .fontColor($r('sys.color.comp_background_list_card'))
                  .borderRadius(6)
                  .onClick(() => {
                    this.playerListAdd(device,10)
                    this.playerListSort()
                  })
              }
            }
            .width('100%')
            .padding(12)
            .backgroundColor($r('sys.color.comp_background_list_card'))
            .borderRadius(8)
            .border({ width: 1, color: '#E0E0E0' })
          }
        })
      }
      .columnsTemplate('1fr 1fr')
      .rowsGap(12)
      .columnsGap(12)
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}