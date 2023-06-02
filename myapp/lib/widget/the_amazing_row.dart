import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myapp/route/route.dart';

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key key,
    this.icon,
    this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 8,
        right: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          boxShadow: [
            BoxShadow(color: Colors.teal[400], spreadRadius: 1),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 20,
              height: 40,
            ),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  PageName.detail,
                  arguments: {label, icon},
                ),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.pink[200]),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
