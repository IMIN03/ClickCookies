import {ConstStr,ConstUrl} from 'utils'
import { DeviceViewModel } from './viewmodel/DeviceViewModel'
import { WorkshopListItem } from './WorkshopListItem'

@ComponentV2
export struct Workshop{
  @Param playerDeviceList: DeviceViewModel[] = []

  @Param totalCookies: number = 0
  @Param clickLevel: number = 1
  @Param cookiesPerClick: number = 1

  @Event totalCookiesAdd: (num:number) => void = () => {};

  build() {
    Column() {
      // 顶部 - Cookies 数量展示
      Row() {
        Text(`Cookies: ${this.totalCookies}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 12, bottom: 12, left: 16 })
      .backgroundColor($r('sys.color.comp_background_list_card'))
      .borderRadius(8)
      .margin({ bottom: 8 })

      // 中间 - List 区域（增强视觉效果）
      List() {
        ForEach(this.playerDeviceList, (device: DeviceViewModel) => {
          ListItem() {
            WorkshopListItem({ deviceInfo: device })
          }
          .padding({ left: 8, right: 8, top: 6, bottom: 4 })
        })
      }
      .width('100%')
      .layoutWeight(1)
      .backgroundColor($r('sys.color.comp_background_list_card'))
      .borderRadius(12)
      .padding(8)
      .margin({ bottom: 16 })
      .scrollBar(BarState.Off)
      .border({
        width: 1,
        color: '#E0E0E0',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 8,
        color: '#00000010',
        offsetX: 0,
        offsetY: 2
      })

      // 底部 - Click 等级和曲奇按钮
      Row() {
        // 左侧 - Click 等级区域
        Column() {
          // 等级信息区域 - 使用固定高度
          Column() {
            Text(`Lv.${this.clickLevel}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ bottom: 4 })

            Text(`${this.cookiesPerClick}/click`)
              .fontSize(12)
              .fontColor('#666666')
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .textAlign(TextAlign.Center)
              .width('100%')
          }
          .height(60) // 固定高度，为按钮预留空间
          .width('100%')
          .justifyContent(FlexAlign.Center)

          // 按钮区域 - 固定在底部
          Button('Level Up')
            .fontSize(14)
            .height(36)
            .width(100)
            .borderRadius(6)
            .backgroundColor('#4CAF50')
            .fontColor($r('sys.color.comp_background_list_card'))
            .onClick(() => {

            })
        }
        .width('50%')
        .height('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor($r('sys.color.comp_background_list_card'))
        .borderRadius(8)
        .padding({ top: 12, bottom: 12, left: 8, right: 8 })

        // 间隔
        Blank()
          .width(12)

        // 右侧 - 曲奇图片
        Column() {
          Image($r(ConstUrl.COOKIESBUTTON))
            .onClick(() => {
              this.totalCookiesAdd(1)
            })
            .objectFit(ImageFit.Contain)
            .width(120)
            .height(120)
            .borderRadius(12)
            .animation({
              duration: 100,
              curve: Curve.EaseInOut
            })
        }
        .width('50%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('#FFF8E1')
        .borderRadius(8)
      }
      .width('100%')
      .height(140)
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 8 })
    .backgroundColor('#F0F0F0')
  }
}