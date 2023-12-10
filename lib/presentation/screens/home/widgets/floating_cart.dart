import 'package:flutter/material.dart';
import 'package:mini_project/presentation/themes/theme.dart';

class FloatingCart extends StatelessWidget {
  const FloatingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        alignment: const Alignment(1.4, -1.5),
        children: [
          FloatingActionButton.extended(
          onPressed: () {},
          
          backgroundColor: Colors.amber,
          enableFeedback: true,
          icon: const Icon(Icons.shopping_cart),
          label: const Text(
            'Cart',
            style: MyTextStyle.buttonTextBlack,
          )),
          Container(             // This is your Badge
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
            decoration: BoxDecoration( // This controls the shadow
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 5,
                  color: Colors.black.withAlpha(50))
              ],
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,  // This would be color of the Badge
            ),             // This is your Badge
            child: const Center(
                // Here you can put whatever content you want inside your Badge
                child: Text('4', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}