export class AuthService {
  private static instance: AuthService;

  public static getInstance(): AuthService {
    if (!AuthService.instance) {
      AuthService.instance = new AuthService();
    }
    return AuthService.instance;
  }

  // Raw network call simulations
  public async loginApi(username: string, password: string): Promise<boolean> {
    // Replace this simulation with your actual connection utilities later
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(username === 'admin' && password === '1234');
      }, 2000);
    });
  }

  public async logoutApi(): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, 1000));
  }
}