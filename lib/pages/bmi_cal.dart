import 'package:bmi/theme/colors.dart';
import 'package:flutter/material.dart';

class BmiCalPage extends StatefulWidget {
  const BmiCalPage({super.key});

  @override
  State<BmiCalPage> createState() => _BmiCalPageState();
}

class _BmiCalPageState extends State<BmiCalPage> {
  String selectGender = '';

  void _selectGender(String gender) {
    setState(() {
      selectGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
      ),
      bottomNavigationBar: SizedBox(
          height: 80,
          child:
              FilledButton(onPressed: () {}, child: const Text('Calculate'))),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      onTap: () => _selectGender('male'),
                      isSelected: selectGender == "male",
                      title: "Male",
                      icon: Icons.male,
                    )),
                Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      title: "Female",
                      isSelected: selectGender == 'Female',
                      onTap: () => _selectGender('Female'),
                      icon: Icons.female,
                    )),
              ],
            ),
            SelectHeight(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: SelectInfoWidget(
                        title: 'Weight',
                        value: '60',
                      )),
                  Expanded(
                      flex: 1,
                      child: SelectInfoWidget(
                        title: "Age",
                        value: '26',
                      )),
                ],
              ),
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
  final bool isSelected;
  final GestureTapCallback onTap;

  const SelectGenderWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Card(
          color: isSelected ? Colors.red : surfaceColor,
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
      ),
    );
  }
}

class SelectInfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const SelectInfoWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                value,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.exposure_minus_1),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectHeight extends StatelessWidget {
  const SelectHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Height', style: Theme.of(context).textTheme.titleMedium),
              Text.rich(TextSpan(
                  text: '150',
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: [
                    TextSpan(
                        text: "cm",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ])),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Slider(
                  min: 140,
                  max: 220,
                  value: 180,
                  onChanged: (value) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
