import 'package:final_lab/features/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).switchTheme();
        },
        icon: Icon(
          Icons.sunny,
          color: Theme.of(context).iconTheme.color,
        ));
  }
}
