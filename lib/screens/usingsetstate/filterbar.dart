import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterBar extends StatefulWidget {
  FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<String> filterNames = [
    "islam",
    "hasib",
    "thabet",
    "aly",
    "ahmed"
  ];
  String selectedFilter = "";

  bool _isPasswordVisible = false;
  TextEditingController _passwordController = TextEditingController();

  void _onFilterSelected(String filter) {
    setState(() {
      selectedFilter = filter;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

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
                          isSelected: selectedFilter == filterName,
                          onTap: () {
                            _onFilterSelected(filterName);
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.red), 
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.red), 
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String filterName;
  final bool isSelected;
  final VoidCallback onTap;

  FilterButton(
      {required this.filterName,
      required this.isSelected,
      required this.onTap});

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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Filter Bar Example'),
        ),
        body: FilterBar(),
      ),
    );
  }
}
