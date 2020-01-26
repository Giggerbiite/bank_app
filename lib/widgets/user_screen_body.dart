import 'package:flutter/material.dart';
import '../widgets/scroll_card.dart';
import '../widgets/add_scroll_card .dart';
import '../widgets/scroll_history.dart';

class UserScreenBody extends StatefulWidget {
  

  @override
  _UserScreenBodyState createState() => _UserScreenBodyState();
}

class _UserScreenBodyState extends State<UserScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ScrollCard(),
            AddScrollCard(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: Text(
                    'Today',
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text('this is today history'),
                          )
                        ],
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Card(
                child: Text('Transaction History'),
                color: Theme.of(context).primaryColor,
              ),
              //decoration: BoxDecoration(),
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: ScrollHistory(),
            ),
          ],
        ),
        //margin: EdgeInsets.all(10.0),
      );
  }
}
