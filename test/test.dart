import 'package:test/test.dart';
import 'package:txtpack/txtpack.dart';

import 'utils.dart';

void main() {
  test('encodeToString', () {
    List<Map<String, String>> values = [
      {"1": "2", "3": "4"},
      {"5": "6"},
    ];
    var encoded = TXTPack.encodeToString(values);
    expect(encoded, equals("1: 2\n3: 4\n\n5: 6\n\n"));
  });
  test('encodeKVsToString', () {
    List<List<KV>> values = [
      [KV("1", "2"), KV("3", "4")],
      [KV("5", "6")],
    ];
    var encoded = TXTPack.encodeKVsToString(values);
    expect(encoded, equals("1: 2\n3: 4\n\n5: 6\n\n"));
  });
  test('decodeFromString', () {
    var decoded = TXTPack.decodeFromString("1: 2\n3: 4\n\n5: 6\n\n");
    expect(
        decoded,
        equals([
          {"1": "2", "3": "4"},
          {"5": "6"}
        ]));
  });

}
