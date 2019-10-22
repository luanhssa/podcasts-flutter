import 'package:flutter/material.dart';
import 'package:podcast/src/bloc/bloc_provider.dart';
import 'package:podcast/src/pages/search/search_bloc.dart';
import 'package:podcast/src/pages/search/search_view.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = SearchBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      bloc: bloc,
      child: SearchView(),
    );
  }
}
