import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:podcast/src/util/common.dart';

class SearchPage extends StatelessWidget with Common {
  final String title = "Search";
  final TextEditingController _textController = TextEditingController(text: '');
  final FocusNode _textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width / 400;
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: () {
          print("tap: ${DateTime.now()}");
          // FocusScope.of(context).requestFocus(new FocusNode());
          hideKeyboard();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            navigationBar(title),
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          _SearchInput(textController: _textController),
                    ),
                  );
                },
                child: Hero(
                  tag: "search_input",
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: mediaQuery * 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 225, 225, 0.6),
                        borderRadius: BorderRadius.circular(mediaQuery * 15.0),
                      ),
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'All Podcasts',
                          border: InputBorder.none,
                          icon: Icon(CupertinoIcons.search),
                        ),
                        maxLines: 1,
                        enabled: false,
                        textCapitalization: TextCapitalization.sentences,
                        focusNode: _textFocus,
                        onChanged: (value) {
                          print(value);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  _SearchInput({this.textController});
  final TextEditingController textController;
  final StreamController tabController = StreamController();
  final StreamController tabNameController = StreamController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width / 400;
    return Hero(
      tag: 'imageHero',
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 45.0),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: StreamBuilder(
                  initialData: 0,
                  stream: tabController.stream,
                  builder: (_, snapshot) {
                    return Container(
                      width: double.infinity,
                      child: CupertinoSegmentedControl<int>(
                        children: {
                          0: Text('All Podcasts'),
                          1: Text('Your Library'),
                        },
                        borderColor: Theme.of(context).primaryColor,
                        selectedColor: Theme.of(context).primaryColor,
                        pressedColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        onValueChanged: (value) {
                          tabController.sink.add(value);
                          switch (value) {
                            case 0:
                              tabNameController.sink.add('All Podcasts');
                              break;
                            case 1:
                              tabNameController.sink.add('Your Library');
                              break;
                          }
                        },
                        groupValue: snapshot.data ?? 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 0.6),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: StreamBuilder(
                stream: tabNameController.stream,
                builder: (_, snapshot) => TextField(
                      autofocus: true,
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: snapshot.data ?? 'All Podcasts',
                        border: InputBorder.none,
                        icon: Icon(CupertinoIcons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.black,
                          splashColor: Colors.transparent,
                          onPressed: textController.clear,
                        ),
                      ),
                      maxLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      onChanged: (value) {
                        // print(value);
                      },
                    ),
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                textController.clear();
                Navigator.of(context).pop();
              },
              child: Text("CANCEL"),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Text("Teste"),
          ),
        ),
      ),
    );
  }
}
