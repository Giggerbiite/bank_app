import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/user_newcard.dart';
import './fetch_or_get_card.dart';
import '../widgets/new_card_dialogue.dart';

class AddScrollCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardList = Provider.of<NewCards>(context, listen: true);

//    void showAlertDialog(BuildContext context) {

//   // set up the button
//   Widget okButton = FlatButton(
//     child: Text("OK"),
//     onPressed: () { },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("My title"),
//     content: Text("This is my message."),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
    void _startAddNewCard(BuildContext ctx) {
      showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewCardDialogue(),
            behavior: HitTestBehavior.opaque,
          );
        },
      );
    }

    return Row(
      children: <Widget>[
        Container(
          height: 100,
          width: 70,
          child: IconButton(
            icon: Icon(Icons.add),
            color: Colors.blueAccent,
            onPressed: () => _startAddNewCard(context),
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          height: 70.0,
          width: 330,
          child: FetchOrGetCard(cardList: cardList),
        )
      ],
    );
  }
}
