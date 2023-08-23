import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/radiocubit/cubit/radio_cubit.dart';
import 'package:training/screens/usingcubit/radio.dart'; 

class RadioScreenWrapper extends StatelessWidget {
  final RadioCubit radioCubit;

  const RadioScreenWrapper({required this.radioCubit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: radioCubit,
      child: RadioScreen(),
    );
  }
}
