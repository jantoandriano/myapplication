@ComponentV2
export struct Carousel {
  @Local bannerItems: string[] = ['#FF6B6B', '#4ECDC4', '#45B6FE', '#9B5DE5']

  build() {
    Column() {
      Swiper() {
        ForEach(this.bannerItems, (itemColor: string, index: number) => {
          Column() {
            Text(`Promo Banner ${index + 1}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.white'))

            Text('Tap to learn more')
              .fontSize(14)
              .fontColor($r('app.color.white'))
              .margin({ top: 8 })
              .opacity(0.8)
          }
          .width('100%')
          .height('100%')
          .backgroundColor(itemColor)
          .justifyContent(FlexAlign.Center)
          .borderRadius(16)
        }, (itemColor: string) => itemColor)
      }
      .width('100%')
      .height(180)
      .autoPlay(true)
      .interval(4000)
      .loop(true)
      .duration(400)
      .indicator(
        Indicator.dot()
          .itemWidth(8)
          .itemHeight(8)
          .selectedItemWidth(16)   // Makes the active page dot wider/pill-shaped
          .selectedItemHeight(8)
          .color('rgba(255, 255, 255, 0.4)')
          .selectedColor($r("app.color.white"))
      )
    }
    .padding({ left: 16, right: 16, top: 10, bottom: 10 })
  }
}