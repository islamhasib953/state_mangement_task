import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'replacement_state.dart';

class ReplacementCubit extends Cubit<ReplacementState> {
  ReplacementCubit() : super(ReplacementInitial());

  void showText() {
    emit(ShowText());
  }

  void showcubit() {
    emit(ShowCubitImage());
  }

  void showcicle() {
    emit(ShowredCircle());
  }

  void Reset() {
    emit(ReplacementInitial());
  }
}
