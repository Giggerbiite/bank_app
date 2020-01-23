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
    // final cardList = Provider.of<NewCards>(context, listen: false);


  // void _addNewCard(String cardNo, String cardType, double amount) {
  //   final newTx = NewCard(
  //     id: cardList.newCard.length.toDouble()-1+1,
  //     amount: amount,
  //     cardNo: cardNo,
  //     cardType: cardType,
  //   );

  //   setState(() {
  //     cardList.newCard.add(newTx);
  //   });
  // }

  // void _startAddNewCard(BuildContext ctx) {
  //   showModalBottomSheet(
  //     context: ctx,
  //     builder: (_) {
  //       return GestureDetector(
  //         onTap: () {},
  //         child: NewCardDialogue(_addNewCard),
  //         behavior: HitTestBehavior.opaque,
  //       );
  //     },
  //   );
  // }
    //  int _value=0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Test title"),
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
