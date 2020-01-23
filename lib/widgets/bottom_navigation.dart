import 'package:flutter/material.dart';


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (_) {},
      currentIndex: 1,
      //align the icons
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.send),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.credit_card),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.transform),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.settings),
          title: Text(''),
        ),
      ],
    );
  }
}