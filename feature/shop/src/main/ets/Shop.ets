@ComponentV2
export struct Shop{

  @Event playerListAdd: (deviceName:string) => void = () => {};

  build() {
    Column(){
      Button('Buy')
        .fontSize(14)
        .height(36)
        .width(100)
        .borderRadius(6)
        .backgroundColor('#4CAF50')
        .fontColor($r('sys.color.comp_background_list_card'))
        .onClick(() => {
          this.playerListAdd('指针')
        })
    }
  }
}