@Component
export struct CustomTextInput {
  @Link value: string

  @Require label: string = ''
  @Require placeholder: string = ''
  @Require inputType: InputType = InputType.Normal

  build() {
    Column() {
      Text(this.label)
        .fontSize(14)
        .padding(2)
        .margin({bottom: 10})
      TextInput({ placeholder: this.placeholder, text: this.value })
        .type(this.inputType)
        .onChange((value: string) => {
          this.value = value
        })
        .height(50)
        .margin({ bottom: 15 })
        .backgroundColor($r('app.color.white'))
        .border({width: 1, color: $r('app.color.primary')})
    }
    .width("90%")
    .alignItems(HorizontalAlign.Start)
  }
}