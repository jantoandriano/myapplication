@ComponentV2
export struct CustomButton {
  @Param @Require label: string = ''
  @Param @Require handleClick: () => void = () => {
  }
  @Param @Require isLoading: boolean = false

  build() {
    Button() {
      Row() {
        if (this.isLoading) {
          LoadingProgress()
            .width(24)
            .height(24)
            .color($r("app.color.white"))
        } else {
          Text(this.label)
            .fontColor($r("app.color.white"))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
        }
      }
      .justifyContent(FlexAlign.Center)
    }
    .onClick(() => {
      if (!this.isLoading) {
        this.handleClick()
      }
    })
    .width('90%')
    .height(50)
    .backgroundColor($r("app.color.primary"))
    .opacity(this.isLoading ? 0.6 : 1.0)
  }
}