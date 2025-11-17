import 'package:flutter/material.dart';

class EmptySaved extends StatelessWidget {
  const EmptySaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 50),
          Text(
            "No Saved Items!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Text(
                "You don't have any saved items. Go to home and add some.",
                maxLines: 2,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
