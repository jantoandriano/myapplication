import { LoginScreen } from '../views/LoginScreen';
import { NavigationTabs } from '../components/NavigationTabs'

@Entry
@ComponentV2
struct Index {
  @Local pageStack: NavPathStack = new NavPathStack()

  // Centralized Traffic Router Map
  @Builder
  pageMap(name: string) {
    if (name === 'LoginScreen') {
      LoginScreen({ pageStack: this.pageStack })
    }

    if (name === 'NavigationTabs') {
      NavigationTabs({ pageStack: this.pageStack })
    }

    if (name === 'ProfileScreen') {
      NavigationTabs({pageStack: this.pageStack})
    }
  }

  @Builder
  appLogoAndTitle() {
    Text('Welcome')
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 40 })
  }

  @Builder
  loginButton() {
    Button('Sign In')
      .onClick(() => {
        this.handleLogin()
      })
      .width('90%')
      .height(50)
      .backgroundColor($r('app.color.primary'))
  }

  build() {
    // Wrap your initial layout inside the modern Navigation container shell
    Navigation(this.pageStack) {
      Column() {
        // App Logo / Title
        this.appLogoAndTitle()

        // Login Button
        this.loginButton()
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.white'))
    }
    .navDestination(this.pageMap)
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
  }

  handleLogin() {
    this.pageStack.pushPathByName('LoginScreen', null)
    console.log("Modern navigation stack triggered: Moving to LoginPage")
  }
}