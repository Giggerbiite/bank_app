import 'package:flutter/material.dart';

class ScrollHistory extends StatelessWidget {
  const ScrollHistory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Card(
                color: Theme.of(context).primaryColor,
                elevation: 5,
                              child: Container(
                  height: 100.0,
                  width: 250.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 70,
                        height: 70,
                        child: Image.network(
                            'https://cdn.dribbble.com/users/338235/screenshots/1127171/google-logo-600.jpg'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Card(
                              child: Text('Google'),
                              color: Theme.of(context).primaryColor,
                            ),
                            Card(
                              child: Text('10:45'),
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
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
