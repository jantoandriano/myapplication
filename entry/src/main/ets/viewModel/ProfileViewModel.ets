import { AuthService } from '../services/AuthService';
import { LoginViewModel } from './LoginViewModel';

@ObservedV2
export class ProfileViewModel {
  @Trace public isLoggingOut: boolean = false;

  private authService = AuthService.getInstance();
  private loginViewModel = new LoginViewModel()

  public executeLogout(onLogoutComplete: () => void) {
    this.isLoggingOut = true;

    this.authService.logoutApi().then(() => {
      this.isLoggingOut = false;
      onLogoutComplete();
      this.loginViewModel.username = ''
      this.loginViewModel.password = ''
    });
  }
}