import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/card_detail_screen.dart';
import '../providers/user_newcard.dart';

class ScrollCard extends StatelessWidget {
  Color color;

  @override
  Widget build(BuildContext context) {
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
      return 'You have selected an invalid card';
    }

    return FutureBuilder(
      future: Provider.of<NewCards>(context, listen: false).fetchAndSetCards(),
      builder: (ctx, dataSnapshot) {
        {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // ...
              // Do error handling stuff
              return Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Consumer<NewCards>(
                builder: (ctx, cardList, child) => Container(
                  color: Theme.of(context).primaryColor,
                  height: 150.0,
                  width: 250.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: PageScrollPhysics(),
                    itemCount: cardList.newCard.length,
                    itemBuilder: (context, int index) {
                      Color color;
                      switch (index % 10) {
                        case 0:
                          color = Colors.red;
                          break;
                        case 1:
                          color = Colors.blue;
                          break;
                        case 2:
                          color = Colors.lightGreen;
                          break;
                        case 3:
                          color = Colors.pink;
                          break;
                        case 4:
                          color = Colors.teal;
                          break;
                        case 5:
                          color = Colors.purple;
                          break;
                        case 6:
                          color = Colors.lightBlue;
                          break;
                        case 7:
                          color = Colors.orange;
                          break;
                        case 8:
                          color = Colors.red;
                          break;
                        case 9:
                          color = Colors.blue;
                          break;
                        case 10:
                          color = Colors.lightGreen;
                          break;
                        case 11:
                          color = Colors.teal;
                          break;
                        case 12:
                          color = Colors.purple;
                          break;
                        case 13:
                          color = Colors.lightBlue;
                          break;
                        case 14:
                          color = Colors.orange;
                          break;
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: (MediaQuery.of(context).size.height) * 0.20,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Card(
                            color: color,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Image.asset(
                                            imageString(cardList
                                                .newCard[index].cardType
                                                .toString()),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            cardList.newCard[index].cardNo
                                                .toString(),
                                            textScaleFactor: 1.2,
                                            style:
                                                TextStyle(letterSpacing: 2.5),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(),
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text(cardList
                                                        .newCard[index].cardType
                                                        .toString()),
                                                    Text(cardList
                                                        .newCard[index].amount
                                                        .toString()
                                                        .toString()),
                                                  ],
                                                ),
                                                Container(
                                                  child: Icon(
                                                      Icons.card_membership),
                                                )
                                              ],
                                            ),
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
                ),
              );
            }
          }
        }
      },
    );
  }
}
