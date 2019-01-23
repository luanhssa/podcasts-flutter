import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/util/common.dart';
import 'package:http/http.dart' as http;

class ListenNowPage extends StatelessWidget with Common {
  final String title = "Listen Now";
  Stream get photos =>
      http.get('https://jsonplaceholder.typicode.com/photos').asStream();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          navigationBar(title),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                stream: photos,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        List data = json.decode(snapshot.data.body);
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> photo = data[index];
                            return ListTile(
                              title: Text(photo['title']),
                              leading: Container(
                                constraints: BoxConstraints(maxWidth: 50.0),
                                child: Image.network(
                                  photo['thumbnailUrl'],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                      break;
                    case ConnectionState.none:
                      return Container();
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
