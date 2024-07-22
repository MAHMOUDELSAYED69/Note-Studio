
import 'package:flutter/material.dart';

class BuildFloatingActionButton extends StatelessWidget {
  const BuildFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: SizedBox(
        width: 68,
        height: 68,
        child: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
