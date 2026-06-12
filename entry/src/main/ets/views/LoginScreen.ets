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
        CustomTextInput({
          value: this.loginViewModel.username,
          changeValue: (val: string) => {
            this.loginViewModel.username = val
          },
          placeholder: "Enter your username",
          label: "Username",
          inputType: InputType.Normal
        })

        // Password Input
        CustomTextInput({
          value: this.loginViewModel.password,
          changeValue: (val: string) => {
            this.loginViewModel.password = val
          },
          placeholder: 'Enter your password',
          label: "Password",
          inputType: InputType.Password
        })

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