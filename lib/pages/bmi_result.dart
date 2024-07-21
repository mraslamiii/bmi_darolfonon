import 'package:bmi/model/human.dart';
import 'package:flutter/material.dart';

class BmiResult extends StatefulWidget {
  final double bmi ;


  const BmiResult({super.key,required this.bmi});

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
          height: 80,
          child:
          FilledButton(onPressed: () {}, child: const Text('Calculate'))),

      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Text(
              'Your Result',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Normal',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green),
                  ),

                  const SizedBox(height: 50,),

                  Text(
                 "${widget.bmi.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  const SizedBox(height: 50,),

                  Text(
                    'You Have a Normal Body Weight,Good Job.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
