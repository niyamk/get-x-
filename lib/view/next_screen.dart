import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Next Screen"),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Back"))
          ],
        ),
      ),
    );
  }
}
