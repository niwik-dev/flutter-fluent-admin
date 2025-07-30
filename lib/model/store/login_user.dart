class LoginUser{
  String username;
  String? avatarUrl;
  bool isLoggedIn;
  String? accessToken;
  String? refreshToken;
  String? captchaKey;

  LoginUser({
    this.username = '游客',
    this.avatarUrl,
    this.isLoggedIn = false,
    this.accessToken,
    this.refreshToken,
    this.captchaKey,
  });

  LoginUser copyWith({
    String? username,
    String? avatarUrl,
    bool? isLoggedIn,
    String? accessToken,
    String? refreshToken,
    String? captchaKey,
  }){
    return LoginUser(
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      captchaKey: captchaKey ?? this.captchaKey,
    );
  }
}