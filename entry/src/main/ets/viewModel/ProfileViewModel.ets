import { AuthService } from '../services/AuthService';

@ObservedV2
export class ProfileViewModel {
  @Trace public isLoggingOut: boolean = false;

  private authService = AuthService.getInstance();

  public executeLogout(onLogoutComplete: () => void) {
    this.isLoggingOut = true;

    this.authService.logoutApi().then(() => {
      this.isLoggingOut = false;
      onLogoutComplete();
    });
  }
}