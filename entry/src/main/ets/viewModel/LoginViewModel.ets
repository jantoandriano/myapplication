@ObservedV2
export class LoginViewModel {
  @Trace public username: string = ''
  @Trace public password: string = ''
  @Trace public isLoading: boolean = false

  public executeLogin(onSuccess: () => void) {
    console.log(`Attempting login in VM for username: ${this.username}`)

    if (!this.username || !this.password) {
      return
    }

    this.isLoading = true

    setTimeout(() => {
      this.isLoading = false
      onSuccess()
    }, 2000)
  }
}