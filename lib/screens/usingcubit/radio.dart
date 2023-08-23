import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/radiocubit/cubit/radio_cubit.dart';
import 'package:training/cubits/radiocubit/cubit/radio_state.dart';

class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Buttons with cubit'),
      ),
      body: BlocBuilder<RadioCubit, RadioState>(
        builder: (context, state) {
          if (state is RadioItemsState) {
            return ListView.builder(
              itemCount: state.radioItems.length,
              itemBuilder: (context, index) {
                final radioItem = state.radioItems[index];

                return RadioListTile(
                  title: Text('Radio $index'),
                  value: index,
                  groupValue:
                      state.radioItems.indexWhere((item) => item.isSelected),
                  onChanged: (value) {
                    BlocProvider.of<RadioCubit>(context).selectRadio(value!);
                  },
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
