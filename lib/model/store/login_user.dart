class LoginUser{
  bool isLoggedIn;
  String username;
  String? avatarUrl;

  LoginUser({
    this.isLoggedIn = false,
    this.username = 'Visitor',
    this.avatarUrl
  });
}