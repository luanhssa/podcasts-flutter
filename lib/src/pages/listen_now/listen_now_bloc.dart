import 'package:podcast/src/bloc/bloc_base.dart';
import 'package:podcast/src/bloc/generic_bloc.dart';
import 'package:http/http.dart' as http;

class ListenNowBloc extends BlocBase {
  ListenNowBloc() {
    _init();
  }

  final GenericBloc<dynamic> items = GenericBloc<dynamic>();

  @override
  void dispose() {
    items?.dispose();
  }

  Future<void> _init() async {
    final dynamic result =
        await http.get('https://jsonplaceholder.typicode.com/photos');
    items.add(result);
  }
}
