import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color boxColor = Colors.red;
  BoxShape boxShape = BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              width: 100,
              curve: Curves.slowMiddle,
              height: 100,
              decoration: BoxDecoration(color: boxColor, shape: boxShape),
            ),
            FilledButton(
                onPressed: () {
                  setState(() {
                    if (boxColor == Colors.red) {
                      boxColor = Colors.black;
                      boxShape = BoxShape.rectangle;
                    } else {
                      boxColor = Colors.red;
                      boxShape = BoxShape.circle;
                    }
                  });
                },
                child: Text(
                  "click me",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
