class StringStream {
  List<String> _strings;

  StringStream(this._strings);

  Stream<String> read() async* {
    for (var str in _strings) {
      yield str;
    }
  }
}
