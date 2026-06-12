// src/main/ets/components/NavigationTabs.ets
import { HomeScreen } from "../views/HomeScreen";
import { ProfileScreen } from "../views/ProfileScreen";

@ComponentV2
export struct NavigationTabs {
  @Param @Require pageStack: NavPathStack = new NavPathStack()

  // State Tabs
  @Local currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  tabBuilder(title: string, index: number, activeIcon: string, inactiveIcon: string) {
    Column() {
      Text(this.currentIndex === index ? activeIcon : inactiveIcon).fontSize(22)
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === index ? $r('app.color.primary') : '#999999')
        .margin({ top: 4 })
    }
    .width('100%')
    .height(56)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          HomeScreen({ pageStack: this.pageStack })
        }
        .tabBar(this.tabBuilder('Home', 0, '🏠', '🏠'))

        TabContent() {
          ProfileScreen()
        }
        .tabBar(this.tabBuilder('Profile', 1, '👤', '👤'))
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFFFFF')
      .barHeight(60)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .hideTitleBar(true) // 💡 ADDED: Hides the default system header back button on the tabs container page
  }
}