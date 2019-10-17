import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'bloc_base.dart';

class GenericBloc<T> implements BlocBase {
  GenericBloc({this.transformer}) : _value = BehaviorSubject<T>();

  GenericBloc.seeded(T value, {this.transformer})
      : _value = BehaviorSubject<T>.seeded(value);

  final StreamTransformer<T, T> transformer;
  final BehaviorSubject<T> _value;
  void Function(T) add(T t) {
    if (!_value.isClosed) {
      _value.sink.add(t);
    }
  }

  void Function(T) addError(T err) {
    if (!_value.isClosed) {
      _value.sink.addError(err);
    }
  }

  Observable<T> get stream => transformer == null
      ? _value.shareValue()
      : _value.transform(transformer).shareValue();

  Observable<T> Function(Duration) get debounceTime => _value.debounceTime;

  T get value => _value.value;

  StreamSubscription<T> listen(void Function(T) func) {
    return _value.listen(func);
  }

//  StreamSubscription<T> Function(void Function(T),
//      {Function onError,
//      Function onDone,
//      bool cancelOnError}) get listen => _value.listen;

  @override
  void dispose() {
    _value?.close();
  }
}
