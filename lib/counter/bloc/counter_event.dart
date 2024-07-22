// 일관성 유지, 이벤트 확장, 기능에 따라 이벤트들의 특정 규칙을 만들때 편리하게 한다.
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}