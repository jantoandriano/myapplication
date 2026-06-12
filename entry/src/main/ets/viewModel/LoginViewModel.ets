import { AuthService } from "../services/AuthService";

@ObservedV2
export class LoginViewModel {
  @Trace public username: string = ''
  @Trace public password: string = ''
  @Trace public isLoading: boolean = false
  @Trace public loginError: string = ''
  @Trace public isError: boolean = false;

  private authService = AuthService.getInstance();

  public executeLogin(onSuccess: () => void) {
    if (!this.username || !this.password) {
      this.loginError = 'Fields cannot be empty';
      return;
    }

    this.isLoading = true;
    this.loginError = '';

    this.authService.loginApi(this.username, this.password)
      .then((isSuccess) => {
        this.isLoading = false;
        if (isSuccess) {
          onSuccess();
        } else {
          this.loginError = 'Invalid credentials';
        }
      })
      .catch(() => {
        this.isLoading = false;
        this.loginError = 'Network error occurred';
      });
  }
}