import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/bloc/bloc_provider.dart';
import 'package:podcast/src/pages/listen_now/listen_now_up_next_card.dart';
import 'package:podcast/src/util/common.dart';
import 'package:http/http.dart' as http;

import 'listen_now/listen_now_bloc.dart';
import 'listen_now/listen_now_view.dart';

class ListenNowPage extends StatefulWidget {
  @override
  _ListenNowPageState createState() => _ListenNowPageState();
}

class _ListenNowPageState extends State<ListenNowPage> {
  ListenNowBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ListenNowBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListenNowBloc>(
      bloc: bloc,
      child: ListenNowView(),
    );
  }
}
