import 'package:flutter/material.dart';

class ReplacementPage extends StatefulWidget {
  @override
  _ReplacementPageState createState() => _ReplacementPageState();
}

class _ReplacementPageState extends State<ReplacementPage> {
  Widget _currentWidget = Text("No button pressed.");

  void _showText() {
    setState(() {
      _currentWidget = Text("Hello, setState");
    });
  }

  void _showCubitImage() {
    setState(() {
      _currentWidget = SizedBox(
        height: 100,
        width: 100,
        child: Image.network(
          "https://shop.bloclibrary.dev/cdn/shop/products/kiss-cut-stickers-5.5x5.5-default-60692ab800721_1200x1200.jpg?v=1617504957",
        ),
      );
    });
  }

  void _showRedCircle() {
    setState(() {
      _currentWidget = Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      );
    });
  }

  void _reset() {
    setState(() {
      _currentWidget = Text("No button pressed.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _currentWidget,
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showText,
              child: Text("Show text"),
            ),
            ElevatedButton(
              onPressed: _showCubitImage,
              child: Text("Show cubit image"),
            ),
            ElevatedButton(
              onPressed: _showRedCircle,
              child: Text("Show the red circle"),
            ),
            ElevatedButton(
              onPressed: _reset,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
