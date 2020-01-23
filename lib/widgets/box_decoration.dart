import 'package:flutter/material.dart';

BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
                border: Border.all(
                  color: Colors.white38,
                  width: 2,
                ),
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(12),
              );
  }
