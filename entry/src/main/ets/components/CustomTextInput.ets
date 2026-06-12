@ComponentV2
export struct CustomTextInput {
  // @Param acts as an immutable input from the parent component
  @Param @Require value: string = ''

  // @Event handles sending the updated string back up to the parent source
  @Event changeValue: (val: string) => void = () => {}

  // All properties passed from parents in V2 must be marked with @Param
  @Param @Require label: string = ''
  @Param @Require placeholder: string = ''
  @Param @Require inputType: InputType = InputType.Normal

  build() {
    Column() {
      Text(this.label)
        .fontSize(14)
        .padding(2)
        .margin({ bottom: 10 })

      TextInput({ placeholder: this.placeholder, text: this.value })
        .type(this.inputType)
        .onChange((newValue: string) => {
          // Instead of mutating the read-only property locally, trigger the event!
          this.changeValue(newValue)
        })
        .height(50)
        .margin({ bottom: 15 })
        .backgroundColor($r('app.color.white'))
        .border({ width: 1, color: $r('app.color.primary') })
    }
    .width("90%")
    .alignItems(HorizontalAlign.Start)
  }
}