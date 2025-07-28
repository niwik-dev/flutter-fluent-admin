import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/store/widget_state.dart';

part 'widget_store.g.dart';

@riverpod
class WidgetStateStore extends _$WidgetStateStore{ 
  @override
  WidgetState build() {
    return WidgetState(isMaximized: true);
  }

  void setMaximized(bool value){
    state = state.copyWith(isMaximized: value);
  }
}