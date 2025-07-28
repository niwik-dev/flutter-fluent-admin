class WidgetState{
  bool isMaximized = true;

  WidgetState({
    required this.isMaximized
  });

  WidgetState copyWith({
    bool? isMaximized = false
  }){
    return WidgetState(
      isMaximized: isMaximized ?? this.isMaximized
    ); 
  }
}