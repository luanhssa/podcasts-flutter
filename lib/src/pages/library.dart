import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/util/common.dart';

class LibraryPage extends StatelessWidget with Common {
  final String title = "Library";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          navigationBar(title),
          SliverPadding(
            padding: MediaQuery.of(context)
                .removePadding(
                  removeTop: true,
                  removeLeft: true,
                  removeRight: true,
                )
                .padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      padding: EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 4.0,
                        color:
                            index % 2 == 0 ? Colors.amber : Colors.blueAccent,
                        child: Center(
                          child: Text("$index"),
                        ),
                      ),
                    ),
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
