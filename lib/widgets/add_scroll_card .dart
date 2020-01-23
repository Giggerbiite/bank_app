import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/user_newcard.dart';
import '../screens/card_detail_screen.dart';
import '../widgets/new_card_dialogue.dart';

class AddScrollCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cardList = Provider.of<NewCards>(context, listen: true);
    
    String imageString(String cardType) {
      if (cardType == 'Visa') {
        return 'assets/banks/visa.jpeg';
      } else if (cardType == 'Master') {
        return 'assets/banks/master.png';
      } else if (cardType == 'Discover') {
        return 'assets/banks/discover.jpeg';
      } else if (cardType == 'American Express') {
        return 'assets/banks/americanexpress.png';
      } else if (cardType == 'MissionLane') {
        return 'assets/banks/missionlane.png';
      }
      return null;
    }

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cardList.newCard.length,
            itemBuilder: (context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 70.0,
                  width: 80.0,
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    elevation: 6,
                    margin: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(CardDetailScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    imageString(
                                        cardList.newCard[index].cardType),
                                    width: 50.0,
                                    height: 50.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
