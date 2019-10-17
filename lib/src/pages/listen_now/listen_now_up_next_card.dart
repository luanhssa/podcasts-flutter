import 'package:flutter/material.dart';

class ListenNowUpNextCard extends StatefulWidget {
  ListenNowUpNextCard(this.photo);
  final dynamic photo;
  @override
  _ListenNowUpNextCardState createState() => _ListenNowUpNextCardState();
}

class _ListenNowUpNextCardState extends State<ListenNowUpNextCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.photo['title']),
      leading: Container(
        width: 75,
//        constraints: BoxConstraints(maxWidth: 100.0),
        child: Image.network(
          widget.photo['thumbnailUrl'],
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
