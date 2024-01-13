import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    // final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.red,
        onTap: () {},
        leading: Container(
          width: 10,
          height: 10,
          color: Colors.red,
          child: Placeholder(
            color: Colors.red,
          ),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
      ),
    );
  }
}
