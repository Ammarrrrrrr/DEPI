import 'package:flutter/material.dart';
import 'package:pharmacy_system/ui/ui.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 50,),
            Text("Heading 1", style: Fonts.heading1),
            Text("Body Large Bold", style: Fonts.bodyLargeBold),
            Text("Body Large Medium", style: Fonts.bodyLargeMedium),
            Text("Body Large Regular", style: Fonts.bodyLargeRegular),
          ],
        ),
      ),
    );
  }
}
