import 'package:flutter/material.dart';
import 'package:training/cubits/cubitfilterbar/cubit/filterbar_cubit.dart';
import 'package:training/cubits/cubitreplacement/cubit/replacement_cubit.dart';
import 'package:training/cubits/radiocubit/cubit/radio_cubit.dart';
import 'package:training/screens/usingcubit/radio.dart';
import 'package:training/screens/usingcubit/replacement_usingcubit.dart';
import 'package:training/screens/usingsetstate/filterbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/screens/usingsetstate/replacement_usingsetstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReplacementCubit>(
          create: (BuildContext context) => ReplacementCubit(),
        ),
        BlocProvider<FilterbarCubit>(
          create: (BuildContext context) => FilterbarCubit(),
        ),
        BlocProvider<RadioCubit>(
          create: (BuildContext context) => RadioCubit(20),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: replacement(),
      ),
    );
  }
}
