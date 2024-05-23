import 'package:flutter/material.dart';
import 'package:my_fitness_progress/src/screen/home/home_page.dart';
import 'package:my_fitness_progress/src/screen/person/my_person_page.dart';
import 'package:my_fitness_progress/src/screen/physical_evaluation/list_evaluation_page.dart';

class DefaultBottomNavigationBar extends StatefulWidget {
  const DefaultBottomNavigationBar({super.key, required this.index, this.close = true});

  final int index;
  final bool close;

  @override
  State<DefaultBottomNavigationBar> createState() => _DefaultBottomNavigationBarState();
}

class _DefaultBottomNavigationBarState extends State<DefaultBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: widget.index != 0 
                ? () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false
                    );
                  }
                : null,
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(
                widget.index == 0 ? Icons.home : Icons.home_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: widget.index != 1
                ? () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ListEvaluationPage(),
                      ),
                    );
                  }
                : null,
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(
                widget.index == 1 ? Icons.bar_chart : Icons.bar_chart_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: widget.index != 2
                ? () async{
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyPersonPage(),
                      ),
                    );
                  }
                : null,
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(
                widget.index == 2 ? Icons.person : Icons.person_outline,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}