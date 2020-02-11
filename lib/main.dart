import 'package:flutter/material.dart';
import 'package:visa/screens/card_detail_screen.dart';
import './screens/bank_user_screen.dart';
import 'package:provider/provider.dart';

import './providers/user_newcard.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NewCards(),
        )
      ],
      child: MaterialApp(
        title: 'Bank App',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.cyan[200],
          accentColor: Colors.cyan[300],
          fontFamily: 'Georgia',
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        routes: {CardDetailScreen.routeName: (ctx) => CardDetailScreen()},
        home: BankUserApp(),
      ),
    );
  }
}
