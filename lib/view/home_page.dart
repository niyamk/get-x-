import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo/controller/counter_controller.dart';
import 'package:get_x_demo/view/next_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    print("Build Refreshed");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${counterController.counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                )),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              child: const Text("Go to Next Page"),
              onPressed: () {
                Get.to(const NextScreen());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("Hello", "Hii",
                      duration: const Duration(seconds: 3),
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: const Text("Get Snackbar")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.dialog(AlertDialog(
                    title: const Text("Title"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("YES"),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("NO"),
                      )
                    ],
                  ));
                },
                child: const Text("Get Dialog")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (Theme.of(context).brightness == Brightness.dark) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
              child: const Text("Dark Mode"),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: Get.height * 0.08,
              width: Get.height * 0.08,
              color: Colors.red,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.counter.value++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
