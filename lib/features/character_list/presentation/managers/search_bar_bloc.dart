import 'package:bloc/bloc.dart';

class SearchBarBloc extends Cubit<bool> {
  SearchBarBloc() : super(false);

  void toggle() {
    emit(!state);
  }

  void closed() {
    emit(false);
  }
}
