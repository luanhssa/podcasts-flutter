import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/bloc/bloc_provider.dart';
import 'package:podcast/src/pages/listen_now/listen_now_bloc.dart';

import 'listen_now_up_next_card.dart';

class ListenNowView extends StatelessWidget {
  final String title = "Listen Now";

  @override
  Widget build(BuildContext context) {
    ListenNowBloc bloc = BlocProvider.of<ListenNowBloc>(context);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
//          navigationBar(title),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<dynamic>(
                stream: bloc.items.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        List data = json.decode(snapshot.data.body);
                        return Scrollbar(
                          child: ListView.separated(
                            itemCount: data.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 20);
                            },
                            itemBuilder: (context, index) {
                              Map<String, dynamic> photo = data[index];
                              return ListenNowUpNextCard(photo);
                            },
                          ),
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
                  return Container();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
