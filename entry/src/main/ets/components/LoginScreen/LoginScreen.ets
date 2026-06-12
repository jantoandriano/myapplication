import { CustomButton } from '../CustomButton';
import { CustomTextInput } from '../CustomTextInput';
import { LoginViewModel } from '../../viewModel/LoginViewModel';

@ComponentV2
export struct LoginScreen {
  @Local vm: LoginViewModel = new LoginViewModel()
  @Param @Require pageStack: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column() {
        // Username Input
        CustomTextInput({
          value: this.vm.username,
          changeValue: (val: string) => {
            this.vm.username = val
          },
          placeholder: "Enter your username",
          label: "Username",
          inputType: InputType.Normal
        })

        // Password Input
        CustomTextInput({
          value: this.vm.password,
          changeValue: (val: string) => {
            this.vm.password = val
          },
          placeholder: 'Enter your password',
          label: "Password",
          inputType: InputType.Password
        })

        // Login Button
        CustomButton({
          label: 'Login',
          handleClick: () => {
            this.vm.executeLogin(() => {
              this.navigateToHome()
            })
          },
          isLoading: this.vm.isLoading
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
    console.log("Login verified. Moving stack timeline forward to HomePage.")
  }
}