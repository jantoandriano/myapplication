import { Carousel } from '../components/Carousel';

@ComponentV2
export struct HomeScreen {
  @Local message: string = 'Home';
  @Param @Require pageStack: NavPathStack = new NavPathStack()

  build() {
    Column() {
      // Header
      Row() {
        Text('Home')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor('#111111')

        // Search Icon
        Image($r('app.media.ic_search'))
          .width(24)
          .height(24)
          .objectFit(ImageFit.Contain)
          .onClick(() => {
          })
      }
      .width('100%')
      .height(56) // Standard mobile top-bar height
      .padding({ left: 20, right: 20 })
      .justifyContent(FlexAlign.SpaceBetween) // 👈 This pushes them to opposite sides
      .alignItems(VerticalAlign.Center) // Center align items vertically
      .backgroundColor('#FFFFFF')
      .shadow({
        radius: 2,
        color: '#10000000',
        offsetX: 0,
        offsetY: 2
      })

      // Carousel
      Carousel()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start) // Aligns header to the very top
  }
}