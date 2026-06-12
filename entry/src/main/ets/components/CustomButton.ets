@Component
export struct CustomButton {
  @Require label: string = ''
  @Require handleClick: () => void = () => {
  }

  build() {
    Button(this.label)
      .onClick(() => {
        this.handleClick()
      })
      .width('90%')
      .height(50)
      .backgroundColor($r("app.color.primary"))
      .fontColor($r("app.color.white"))
  }
}