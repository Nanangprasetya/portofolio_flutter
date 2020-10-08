import 'package:bloc/bloc.dart';

abstract class NavigationState {}

// Tambahkan State Page baru disini
class StateA extends NavigationState {}

class StateB extends NavigationState {}

class StateC extends NavigationState {}

// Tambahkan Event Page baru disini
enum NavigationEvent { pageA, pageB, pageC }

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(StateA());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
// Tambahkan Case Page baru disini
    switch (event) {
      case NavigationEvent.pageA:
        yield StateA();
        break;
      case NavigationEvent.pageB:
        yield StateB();
        break;
      case NavigationEvent.pageC:
        yield StateC();
        break;
    }
  }
}
