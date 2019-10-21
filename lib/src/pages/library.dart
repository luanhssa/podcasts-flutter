import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast/src/bloc/bloc_provider.dart';
import 'package:podcast/src/pages/library/library_bloc.dart';
import 'package:podcast/src/pages/library/library_view.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  LibraryBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = LibraryBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LibraryBloc>(
      bloc: bloc,
      child: LibraryView(),
    );
  }
}
