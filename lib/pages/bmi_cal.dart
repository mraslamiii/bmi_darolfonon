import 'package:flutter/material.dart';

class BmiCalPage extends StatelessWidget {
  const BmiCalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
      ),
      bottomNavigationBar: SizedBox(
          height: 100,
          child: FilledButton(onPressed: () {}, child: Text('Calculate'))),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      title: "Male",
                      icon: Icons.male,
                    )),
                Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      title: "Female",
                      icon: Icons.female,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectGenderWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const SelectGenderWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 12),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
