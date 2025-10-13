import {ConstStr,ConstUrl} from 'utils'

@Builder
export function TabBarBuilder(url:string,title:string) {
  Column(){
    Image($r(url))
      .height(24)
      .width(24)
      .objectFit(ImageFit.Contain)
      .margin({top:12})
    Text(title)
      .fontSize(14)
      .height(16)
      .margin({top:4,bottom:4})
  }
  .height('100%')
  .width('100%')
  .justifyContent(FlexAlign.End)
  .alignItems(HorizontalAlign.Center)
}
