import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit(int numberOfRadios)
      : super(RadioItemsState(List.generate(
            numberOfRadios, (index) => RadioItem(isSelected: false))));

  void selectRadio(int radioIndex) {
    final currentState = state as RadioItemsState;
    final updatedItems = currentState.radioItems
        .map((item) => RadioItem(
            isSelected: currentState.radioItems.indexOf(item) == radioIndex))
        .toList();

    emit(RadioItemsState(updatedItems));
  }
}
