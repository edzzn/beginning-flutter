import 'package:flutter/material.dart';

class MaximumBid extends StatefulWidget {
  MaximumBid({Key key}) : super(key: key);

  @override
  _MaximumBidState createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  double _maxBid = 0.0;

  @override
  void _increaceMyMaxBid() {
    setState(() {
      _maxBid += 50.0;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('My Maximun Bid: $_maxBid'),
          FlatButton.icon(
            onPressed: () => _increaceMyMaxBid(),
            icon: Icon(Icons.add_circle),
            label: Text('Increse Bid'),
          )
        ],
      ),
    );
  }
}
