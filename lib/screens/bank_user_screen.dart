import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/user_screen_body.dart';

class BankUserApp extends StatefulWidget {
  @override
  BankUserAppState createState() {
    return BankUserAppState();
  }
}

class BankUserAppState extends State<BankUserApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Your Cards"),
        actions: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/20488554.png',
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
      body: UserScreenBody(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (){}
      // ),
    );
  }
}
