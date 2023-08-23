part of 'replacement_cubit.dart';

@immutable
sealed class ReplacementState {}

final class ReplacementInitial extends ReplacementState {}

final class ShowText extends ReplacementState {}

final class ShowCubitImage extends ReplacementState {}

final class ShowredCircle extends ReplacementState {}
