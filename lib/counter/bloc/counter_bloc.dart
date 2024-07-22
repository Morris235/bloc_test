import 'dart:async';

import 'package:bloc_test/counter/bloc/counter_event.dart';
import 'package:bloc_test/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 이벤트별 동작 정의
// CounterEvent와 CounterState를 상속하여 카운터 앱의 비즈니스 로직을 정의
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // 초기 상태를 기본 초기화 상태로 적용
  CounterBloc() : super(CounterState()) {
    // IncrementEvent가 발생했을 때 _handleIncrementEvent 메서드를 호출하도록 등록
    // on : Bloc 클래스의 생성자 내에서 호출되며, 이벤트와 핸들러 메서드를 연결하는 역할
    on<IncrementEvent>(_handleIncrementEvent);
    on<DecrementEvent>(_handleDecrementEvent);
  }

  // 해당 메서드를 호출하면 새로운 상태는 Bloc의 상태 스트림에 추가되고, 
  // 이 스트림을 구독하고 있는 위젯이나 컴포넌트가 새로운 상태를 수신하여 UI를 업데이트하는 역할을 한다.
  void _handleIncrementEvent(IncrementEvent event, Emitter<CounterState> emit) {
    print('IncrementEvent 발생');
    // 현재 상태를 변경하지 않고 현 상태의 카운터 값을 1증가시킨 새로운 상태를 반환하고 
    // 새로운 상태는 UI로 전달해서 카운터 값을 업데이트.
    emit(state.copyWith(count: state.count + 1));
  }

  void _handleDecrementEvent(DecrementEvent event, Emitter<CounterState> emit) {
    print('DecrementEvent 발생');
    // 기본적으로 상태를 변경하지 않고 새로운 상태를 반환한다.
    emit(state.copyWith(count: state.count - 1));
  }
}
