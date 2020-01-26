import 'package:flutter/material.dart';
import '../screens/card_detail_screen.dart';

import '../providers/user_newcard.dart';

class FetchOrGetCard extends StatelessWidget {
  final NewCards cardList;
  const FetchOrGetCard({
    Key key,
    @required this.cardList,
  }) : super(key: key);

  
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
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  Navigator.of(context).pushNamed(CardDetailScreen.routeName);
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
                              imageString(cardList.newCard[index].cardType),
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
    );
  }
}
