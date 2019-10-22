import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/bloc/bloc_provider.dart';
import 'package:podcast/src/pages/brose/browse_bloc.dart';
import 'package:podcast/src/pages/brose/browse_view.dart';
import 'package:podcast/src/util/common.dart';

class BrowsePage extends StatefulWidget with Common {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  BrowseBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BrowseBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrowseBloc>(
      bloc: bloc,
      child: BrowseView(),
    );
  }
}
