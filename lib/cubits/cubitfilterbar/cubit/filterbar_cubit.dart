import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'filterbar_state.dart';

class FilterbarCubit extends Cubit<FilterbarState> {
  FilterbarCubit() : super(FilterbarInitial());

  void selectFilter(String filterName) {
    emit(FilterSelected(filterName));
  }

  void togglePasswordVisibility(bool isPasswordVisible) {
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }
}
