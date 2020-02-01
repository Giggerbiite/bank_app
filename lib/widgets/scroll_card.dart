import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/card_detail_screen.dart';
import '../providers/user_newcard.dart';

class ScrollCard extends StatefulWidget {
  @override
  _ScrollCardState createState() => _ScrollCardState();
}

class _ScrollCardState extends State<ScrollCard> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;
  int c = 0;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit == true) {
      print('Check init');
      Provider.of<NewCards>(context).fetchAndSetCards();
    }
    print('init set to false');
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build started");
    final cardList = Provider.of<NewCards>(context, listen: true);
    print(cardList.newCard);
    print("build happned");
    //print(cardList.newCard);
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

    c += 1;
    print('value of C is');
    print(c);
    

    return Container(
      color: Theme.of(context).primaryColor,
      height: 150.0,
      width: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        itemCount: cardList.newCard.length,
        itemBuilder: (context, int index) {
          //print(cardList.newCard[index].cardType.toString());
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: (MediaQuery.of(context).size.height)*0.20,
              width:  MediaQuery.of(context).size.width * 0.65,
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
                                imageString(cardList.newCard[index].cardType
                                    .toString()),
                                width: 50.0,
                                height: 50.0,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                cardList.newCard[index].cardNo.toString(),
                                textScaleFactor: 1.2,
                                style: TextStyle(letterSpacing: 2.5),
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
                                        Text(cardList.newCard[index].cardType
                                            .toString()),
                                        Text(cardList.newCard[index].amount
                                            .toString()
                                            .toString()),
                                      ],
                                    ),
                                    Container(
                                      child: Icon(Icons.card_membership),
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
    );
  }
}
