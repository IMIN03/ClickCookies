import {  DeviceModel } from "./model/DeviceModel"
import { DeviceViewModel } from "./viewmodel/DeviceViewModel"

@ComponentV2
export struct WorkshopListItem{
  @Param @Require deviceInfo:DeviceViewModel

  build() {
    Row() {
      RelativeContainer() {
        // 左侧图标
        Row() {
          Image('')
            .width(40)
            .height(40)
            .objectFit(ImageFit.Contain)
        }
        .id('icon')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .margin({ left: 16 })

        // 设备名称
        Row() {
          Text()
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#333333')
        }
        .id('name')
        .alignRules({
          left: { anchor: 'icon', align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .margin({ left: 12 })

        // 右侧数量和产出信息
        Row() {
          Text()
            .fontSize(14)
            .fontColor('#666666')
        }
        .id('stats')
        .alignRules({
          right: { anchor: '__container__', align: HorizontalAlign.End },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .margin({ right: 16 })
      }
      .width('100%')
      .height(60)
    }
    .backgroundColor('#FFF')
    .borderRadius(12)
    .shadow({
      radius: 8,
      color: '#1A000000',
      offsetX: 0,
      offsetY: 2
    })
    .border({
      width: 1,
      color: '#E5E5E5'
    })
  }
}