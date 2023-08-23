import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/cubitreplacement/cubit/replacement_cubit.dart';

class replacement extends StatelessWidget {
  const replacement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            BlocBuilder<ReplacementCubit, ReplacementState>(
              builder: (context, state) {
                if (state is ShowText) {
                  return Text("Hello,Cubit");
                } else if (state is ShowCubitImage) {
                  return SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                        "https://shop.bloclibrary.dev/cdn/shop/products/kiss-cut-stickers-5.5x5.5-default-60692ab800721_1200x1200.jpg?v=1617504957"),
                  );
                } else if (state is ShowredCircle) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  );
                } else {
                  return Text("not button pressed.");
                }
              },
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ReplacementCubit>().showText();
              },
              child: Text("Show text"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ReplacementCubit>().showcubit();
              },
              child: Text("Show cubit image"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ReplacementCubit>().showcicle();
              },
              child: Text("Show the red circle"),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ReplacementCubit>().Reset();
              },
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
