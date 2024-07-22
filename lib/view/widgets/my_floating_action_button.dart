import 'package:flutter/material.dart';

import '../../utils/constants/routes.dart';

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
          onPressed: ()=> Navigator.pushNamed(context ,RouteManager.addNoteScreen),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    );
  }
}
