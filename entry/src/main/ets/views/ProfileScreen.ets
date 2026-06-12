import { AuthService } from "../services/AuthService"
import { ProfileViewModel } from "../viewModel/ProfileViewModel"

@ComponentV2
export struct ProfileScreen {

  @Param @Require pageStack: NavPathStack = new NavPathStack()

  private profileViewModel = new ProfileViewModel()

  build() {
    NavDestination() {
      Button("Logout")
        .onClick(() => {
          this.profileViewModel.executeLogout(() => {
            this.handleLogout()
          })
        })
        .backgroundColor($r('app.color.primary'))
    }
  }


  private handleLogout() {
    this.pageStack.pushPathByName('LoginScreen', null)
  }
}