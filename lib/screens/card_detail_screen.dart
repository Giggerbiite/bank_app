import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  static const routeName = '/card-detail';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Your Card Details"),
      ),
    );
  }
}
