import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:training/cubits/cubitfilterbar/cubit/filterbar_cubit.dart';

import 'package:training/cubits/cubitfilterbar/cubit/filterbar_state.dart';

class FilterBar extends StatelessWidget {
  final FilterbarCubit filterbarCubit;

  FilterBar({Key? key, required this.filterbarCubit}) : super(key: key);

  List<String> filterNames = [
    "islam",
    "hasib",
    "thabet",
    "aly",
    "ahmed"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (String filterName in filterNames)
                        FilterButton(
                          filterName: filterName,
                          isSelected: filterbarCubit.state is FilterSelected &&
                              (filterbarCubit.state as FilterSelected)
                                      .selectedFilter ==
                                  filterName,
                          onTap: () {
                            filterbarCubit.selectFilter(filterName);
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                PasswordTextField(filterbarCubit: filterbarCubit),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final FilterbarCubit filterbarCubit;

  PasswordTextField({required this.filterbarCubit});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordVisible = filterbarCubit.state is PasswordVisibilityChanged
        ? (filterbarCubit.state as PasswordVisibilityChanged).isPasswordVisible
        : false;

    TextEditingController _passwordController = TextEditingController();

    return TextField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            filterbarCubit.togglePasswordVisibility(!_isPasswordVisible);
          },
          child: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String filterName;
  final bool isSelected;
  final VoidCallback onTap;

  FilterButton({
    required this.filterName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      width: MediaQuery.of(context).size.width * 0.26,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            isSelected ? Colors.red : Colors.grey,
          ),
        ),
        child: Text(
          filterName,
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
