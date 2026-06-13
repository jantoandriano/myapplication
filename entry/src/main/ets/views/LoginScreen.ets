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
        // ── USERNAME CONTAINER ─────────────────────────────
        Column() {
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
              .margin({ top: 4, left: 4 }) // Clean spacing, no hacky negative offsets needed
          }
        }
        .alignItems(HorizontalAlign.Start) // Align input + error to the left of this 90% box
        .margin({ bottom: 16 }) // Clean separation between input blocks

        // ── PASSWORD CONTAINER ─────────────────────────────
        Column() {
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
              .margin({ top: 4, left: 4 })
          }
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 32 }) // Generous breathing room before the action button

        // ── LOGIN BUTTON ──────────────────────────────────
        // (Assuming your CustomButton handles its own 90% width or adapts to parent bounds)
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
      .justifyContent(FlexAlign.Center) // Locks the entire login card group in the center vertical viewport
      .backgroundColor($r('app.color.white'))
    }
    .hideTitleBar(true)
  }

  navigateToHome() {
    this.pageStack.pushPathByName('NavigationTabs', null)
    console.log("Login verified.")
  }
}