import 'package:flutter/material.dart';

// This is the type used by the popup menu below.
enum MenuItem { menusOne, resetCount }

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;
  MenuItem? selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tally Tracker'), actions: [
          PopupMenuButton<MenuItem>(
              initialValue: selectedMenuItem,
              onSelected: (MenuItem item) {
                setState(() {
                  selectedMenuItem = item;
                });
              },
              itemBuilder: (
                BuildContext context,
              ) =>
                  <PopupMenuEntry<MenuItem>>[
                    PopupMenuItem<MenuItem>(
                      value: MenuItem.resetCount,
                      child: ListTile(
                        leading: const Icon(Icons.exposure_minus_1_outlined),
                        title: Text('Minus one'),
                      ),
                      onTap: () {
                        setState(() {
                          if (clickCounter == 0) return;
                          clickCounter--;
                        });
                      },
                    ),
                    PopupMenuItem<MenuItem>(
                      value: MenuItem.menusOne,
                      child: ListTile(
                        leading: const Icon(Icons.refresh_rounded),
                        title: Text('Reset clicks'),
                      ),
                      onTap: () {
                        setState(() {
                          clickCounter = 0;
                        });
                      },
                    ),
                  ])
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 140, fontWeight: FontWeight.w100, fontFamily: 'FsSevegments'),
              ),
              Text(
                'Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25),
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  clickCounter++;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
