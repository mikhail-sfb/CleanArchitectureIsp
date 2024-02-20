

import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
        
        },
        icon: Icon(Icons.edit, color: Theme.of(context).iconTheme.color,));
  }
}