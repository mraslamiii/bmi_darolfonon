import 'package:bmi/model/human.dart';
import 'package:bmi/pages/bmi_result.dart';
import 'package:bmi/theme/colors.dart';
import 'package:flutter/material.dart';

//todo fix bug gender

class BmiCalPage extends StatefulWidget {
  const BmiCalPage({super.key});

  @override
  State<BmiCalPage> createState() => _BmiCalPageState();
}

class _BmiCalPageState extends State<BmiCalPage> {
  Human human = Human(age: 30, height: 180, gender: '', weight: 80);

  void _selectGender(String gender) {
    // setState(() {
    //   human.gender = gender;
    // });
  }

  double _calculateBmi() {
    return human.weight / (human.height * human.height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bmi Calculator'),
      ),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: FilledButton(
              onPressed: () {
                double bmi = _calculateBmi();
                bmi = bmi * 10000;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResult(
                        bmi: bmi,
                      ),
                    ));
              },
              child: const Text('Calculate'))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      onTap: () => _selectGender('male'),
                      isSelected: human.gender == "male",
                      title: "Male",
                      icon: Icons.male,
                    )),
                Expanded(
                    flex: 1,
                    child: SelectGenderWidget(
                      title: "Female",
                      isSelected: human.gender == 'Female',
                      onTap: () => _selectGender('Female'),
                      icon: Icons.female,
                    )),
              ],
            ),
            SelectHeight(
              height: human.height,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: SelectInfoWidget(
                        title: 'Weight',
                        value: human.weight,
                      )),
                  Expanded(
                      flex: 1,
                      child: SelectInfoWidget(
                        title: "Age",
                        value: human.age,
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

class SelectInfoWidget extends StatefulWidget {
  final String title;
  double value;

  SelectInfoWidget({super.key, required this.title, required this.value});

  @override
  State<SelectInfoWidget> createState() => _SelectInfoWidgetState();
}

class _SelectInfoWidgetState extends State<SelectInfoWidget> {
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
                widget.title,
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "${widget.value}",
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.value--;
                            });
                          },
                          icon: Icon(Icons.remove)),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.value++;
                            });
                          },
                          icon: Icon(Icons.add)),
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

class SelectHeight extends StatefulWidget {
  double height;

  SelectHeight({super.key, required this.height});

  @override
  State<SelectHeight> createState() => _SelectHeightState();
}

class _SelectHeightState extends State<SelectHeight> {
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
                  text: widget.height.toStringAsFixed(2),
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
                  value: widget.height,
                  onChanged: (value) {
                    setState(() {
                      widget.height = value;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
