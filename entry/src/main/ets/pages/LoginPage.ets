import { CustomButton } from '../components/CustomButton';
import { CustomTextInput } from '../components/CustomTextInput';

@Entry
@Component
struct LoginPage {
  @State username: string = ''
  @State password: string = ''

  build() {
    Column() {

      // Username Input
      CustomTextInput({
        value: $username,
        placeholder: "Enter your username",
        label: "Username",
        inputType: InputType.Normal
      })

      // Password Input
      CustomTextInput({
        value: $password,
        placeholder: 'Enter your password',
        label: "Password",
        inputType: InputType.Password
      })

      // Login Button
      CustomButton({
        label: 'Login',
        handleClick: () => {
          this.handleLogin()
        }
      })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.white'))
  }

  handleLogin() {
    console.log("Login with username", this.username)
  }
}