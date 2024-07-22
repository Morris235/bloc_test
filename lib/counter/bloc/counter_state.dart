// 카운트에 필요한 count 상태를 정의.
class CounterState {
  final int count;
  CounterState({this.count = 0});

  // 불변성 유지, 객체의 일부 필드를 업데이트할 수 있도록 해준다.
  // 해당 메서드르 ㄹ사용하여 새로운 상태를 생성할 때, 변경하려는 count 값을 전달하면 해당 필드만 변경되며 
  // 만약 count 값을 전달하지 않으면 현재의 count값은 그대로 유지된다.
  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }
}
