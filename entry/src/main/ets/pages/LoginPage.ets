import hilog from '@ohos.hilog';
import { CustomTextInput } from '../components/CustomTextInput';

@Entry
@Component
struct LoginPage {
  @State username: string = ''
  @State password: string = ''

  private DOMAIN: number = 0x0001;
  private TAG: string = "LoginComponent1"


  build() {
    Column() {

      // Username Input
      CustomTextInput({value: this.username, placeholder: "Enter your username", label: "Username", inputType: InputType.Normal})

      // Password Input
      CustomTextInput({value: this.password, placeholder: 'Enter your password', label: "Password", inputType: InputType.Password})

      // Login Button
      Button('Log In')
        .onClick(() => {
          this.handleLogin()
        })
        .width('90%')
        .height(50)
        .backgroundColor($r("app.color.primary"))
        .fontColor($r("app.color.white"))

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.white'))
  }

  handleLogin() {
    hilog.info(this.DOMAIN, this.TAG, "Login with username", this.username)
  }
}