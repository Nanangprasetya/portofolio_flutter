
import 'package:bloc/bloc.dart';

abstract class NavigationState {}

class StateA extends NavigationState {}

class StateB extends NavigationState {}

class StateC extends NavigationState {}

enum NavigationEvent { pageA, pageB, pageC }

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(StateA());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
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