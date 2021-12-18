class KV {
  final String key;
  final String value;

  KV(this.key, this.value);

  static List<KV> fromMap(Map<String, String> map) {
    List<KV> list = [];
    map.forEach((key, value) {
      list.add(KV(key, value));
    });
    return list;
  }

  static KV fromString(String str) {
    var values = str.split(": ");
    if (values.length == 1) {
      return KV(values[0], "");
    } else {
      return KV(values[0], values[1]);
    }
  }
}

class TXTPack {
  static final int newLineUnicode = '\n'.codeUnitAt(0);
  static final int colonUnicode = ':'.codeUnitAt(0);
  static final int whiteSpaceUnicode = ' '.codeUnitAt(0);

  static String encodeToString(List<Map<String, String>> data) {
    String result = "";
    for (var pack in data) {
      pack.forEach((key, value) {
        result += key + ': ' + value + '\n';
      });
      result += '\n';
    }
    return result;
  }

  static String encodeKVsToString(List<List<KV>> data) {
    String result = "";
    for (var pack in data) {
      pack.forEach((kv) {
        result += kv.key + ': ' + kv.value + '\n';
      });
      result += '\n';
    }
    return result;
  }

  static List<Map<String, String>> decodeFromString(String data) {
    List<Map<String, String>> result = [];
    var packs = data.split("\n\n");
    packs.removeLast();
    for (var pack in packs) {
      Map<String, String> packMap = {};
      var pairs = pack.split("\n");
      for (var pair in pairs) {
        var kv = KV.fromString(pair);
        packMap[kv.key] = kv.value;
      }
      result.add(packMap);
    }
    return result;
  }
}
