import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/store/login_user.dart';

part 'login_store.g.dart';

@Riverpod(keepAlive: true)
LoginUser loginUserStore(Ref ref){
  return LoginUser();
}
