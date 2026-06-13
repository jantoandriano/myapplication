import { CustomButton } from '../components/CustomButton';
import { CustomTextInput } from '../components/CustomTextInput';
import { LoginViewModel } from '../viewModel/LoginViewModel';

@ComponentV2
export struct LoginScreen {
  @Local loginViewModel: LoginViewModel = new LoginViewModel()
  @Param @Require pageStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        // Username Input
        Column(){
          CustomTextInput({
            value: this.loginViewModel.username,
            changeValue: (val: string) => {
              this.loginViewModel.username = val
            },
            placeholder: "Enter your username",
            label: "Username",
            inputType: InputType.Normal
          })

          if (this.loginViewModel.usernameError) {
            Text(this.loginViewModel.usernameError)
              .fontSize(12)
              .fontColor($r('app.color.error'))
              .margin({ top: -10, bottom: 10, left: '5%' })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        // Password Input
        Column(){
          CustomTextInput({
            value: this.loginViewModel.password,
            changeValue: (val: string) => {
              this.loginViewModel.password = val
            },
            placeholder: 'Enter your password',
            label: "Password",
            inputType: InputType.Password
          })

          if (this.loginViewModel.passwordError) {
            Text(this.loginViewModel.passwordError)
              .fontSize(12)
              .fontColor($r('app.color.error'))
              .margin({ top: -10, bottom: 10, left: '5%' })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        // Login Button
        CustomButton({
          label: 'Login',
          handleClick: () => {
            this.loginViewModel.executeLogin(() => {
              this.navigateToHome()
            })
          },
          isLoading: this.loginViewModel.isLoading
        })

      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.white'))
    }
    .hideTitleBar(true)
  }

  navigateToHome() {
    this.pageStack.pushPathByName('NavigationTabs', null)
    console.log("Login verified.")
  }
}