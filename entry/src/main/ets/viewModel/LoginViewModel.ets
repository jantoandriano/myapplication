import { AuthService } from "../services/AuthService";

@ObservedV2
export class LoginViewModel {
  @Trace public username: string = ''
  @Trace public password: string = ''
  @Trace public usernameError: string = ''
  @Trace public passwordError: string = ''
  @Trace public isLoading: boolean = false
  @Trace public loginError: string = ''
  @Trace public isError: boolean = false;
  private authService = AuthService.getInstance();

  public executeLogin(onSuccess: () => void) {
    this.usernameError = ''
    this.passwordError = ''

    let isFormValid = true

    if (!this.username.trim()) {
      this.usernameError = 'Username is required'
      isFormValid = false
    } else if (this.username.length < 4) {
      this.usernameError = "Username must be at least 4 characters long"
      isFormValid = false
    }

    if (!this.password) {
      this.passwordError = 'Password is required'
      isFormValid = false
    } else if (this.password.length < 6) {
      this.passwordError = "Password must be at least 6 characters long"
      isFormValid = false
    }

    if (!isFormValid) {
      return
    }

    this.isLoading = true;

    this.authService.loginApi(this.username, this.password)
      .then((isSuccess) => {
        this.isLoading = false
        if (isSuccess) {
          onSuccess()
        } else {
          this.passwordError = 'Incorrect username or password.'
        }
      })
      .catch(() => {
        this.isLoading = false
        this.usernameError = 'Network connection failed. Please try again.'
      })
  }
}