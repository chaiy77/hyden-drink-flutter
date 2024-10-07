import 'package:flutter/foundation.dart';

void debugLog(String message) {
  if (kDebugMode) {
    debugPrint(message);
  }
}

String generateSKU(String lastSKU) {
  if (lastSKU.isEmpty) {
    return 'A-00001';
  }

  String c = lastSKU.split("-")[0];
  int i = int.parse(lastSKU.split("-")[1]);
  i = i + 1;

  if (i < 10) {
    c = '$c-0000${i.toString()}';
  } else if ((10 < i) && (i < 100)) {
    c = '$c-000${i.toString()}';
  } else if ((100 < i) && (i < 1000)) {
    c = '$c-00${i.toString()}';
  } else if ((1000 < i) && (i < 10000)) {
    c = '$c-0${i.toString()}';
  } else {
    c = '$c-${i.toString()}';
  }
  return c;
}
