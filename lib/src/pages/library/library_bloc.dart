import 'package:podcast/src/bloc/bloc_base.dart';
import 'package:podcast/src/bloc/generic_bloc.dart';

class LibraryBloc extends BlocBase {
  final GenericBloc<dynamic> items = GenericBloc<dynamic>();

  @override
  void dispose() {
    items?.dispose();
  }
}
