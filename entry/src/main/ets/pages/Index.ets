import hilog from '@ohos.hilog'
import { router, Router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column() {
      // App Logo / Title
      Text('Welcome')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 40 })

      // Login Button
      Button('Sign In')
        .onClick(() => {
          this.handleLogin()
        })
        .width('90%')
        .height(50)
        .backgroundColor($r('app.color.primary'))

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.white'))
  }

  handleLogin() {
    // Implement your authentication API or routing logic here
    let uiContext: UIContext = this.getUIContext();
    let router = uiContext.getRouter();

    router.pushUrl({ url: "pages/LoginPage" }).then(() => {
      console.log("Success navigate to LoginPage")
    }).catch(() => {
      console.log("Error navigate to LoginPage")
    })

  }
}
