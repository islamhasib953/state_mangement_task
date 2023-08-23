import 'package:meta/meta.dart';

@immutable
abstract class FilterbarState {}

class FilterbarInitial extends FilterbarState {}

class FilterSelected extends FilterbarState {
  final String selectedFilter;

  FilterSelected(this.selectedFilter);
}

class PasswordVisibilityChanged extends FilterbarState {
  final bool isPasswordVisible;

  PasswordVisibilityChanged(this.isPasswordVisible);
}
