import 'package:bloc_test/counter/bloc/counter_bloc.dart';
import 'package:bloc_test/counter/bloc/counter_event.dart';
import 'package:bloc_test/counter/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    // CounterBloc을 생성, 현재 화면의 context에서 사용할수 있게된다.
    return Scaffold(
        body: BlocProvider(
      create: (context) => CounterBloc(),
      child: Center(
        // CounterBloc의 상태를 감시하고, 상태가 변경될 때마다 UI를 업데이트 한다.
        // 이때, builder 함수 내에서 현재 상태를 전달하고 UI를 빌드 한다.
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.count}',
                  style: const TextStyle(fontSize: 50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton.large(
                      heroTag: 'decrement',
                      onPressed: () {
                        // DecrementEvent를 발생시켜, CounterBloc 내에서 상태의 count 값이 증가하고 UI가 변경된다.
                        context.read<CounterBloc>().add(
                              DecrementEvent(),
                            );
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton.large(
                      heroTag: 'increment',
                      onPressed: () {
                        context.read<CounterBloc>().add(
                              IncrementEvent(),
                            );
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
