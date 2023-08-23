import 'package:meta/meta.dart';

@immutable
class RadioItem {
  final bool isSelected;

  RadioItem({required this.isSelected});
}

@immutable
abstract class RadioState {}

class RadioItemsState extends RadioState {
  final List<RadioItem> radioItems;

  RadioItemsState(this.radioItems);
}
