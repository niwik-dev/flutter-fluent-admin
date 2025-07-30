import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/store/login_user.dart';

part 'login_store.g.dart';

@riverpod
class LoginUserStore extends _$LoginUserStore {
  @override
  LoginUser build() {
    return LoginUser();
  }

  void setLoginUser(LoginUser user){
    state = user;
  }

  void logout(){
    state = LoginUser(
      isLoggedIn: false,
      username: '游客',
      avatarUrl: null,
      accessToken: null,
      captchaKey: null
    );
  }
}
