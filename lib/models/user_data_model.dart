import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NewCard {
  final int id;
  final String cardNo;
  final String cardType;
  final double amount;
  

  NewCard({
    @required this.id,
    @required this.cardNo,
    @required this.cardType,
    @required this.amount,
    
  });
}
