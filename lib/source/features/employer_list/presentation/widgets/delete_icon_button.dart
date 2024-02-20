import 'package:final_lab/features/delete_item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteItemProvider>(
      builder: (context, value, child) => IconButton(
          onPressed: () {
            Provider.of<DeleteItemProvider>(context, listen: false)
                .deleteGroup(context: context, groupId: value.toggledItem);
          },
          icon: value.toggled
              ? Icon(
                  Icons.delete,
                  color: Theme.of(context).iconTheme.color,
                )
              : const Icon(null)),
    );
  }
}
