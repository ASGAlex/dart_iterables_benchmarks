import 'package:map_vs_list_benchmark/my_object.dart';

export 'package:map_vs_list_benchmark/my_object.dart';

int mapAccessHashSet(int objectsCount) {
  ///
  /// Preparing data. No need to benchmark here
  ///
  final objects = MyObject.createObjects(objectsCount, true);

  final keyValueMap = <MyObject, bool>{};
  for (final object in objects) {
    if (int.parse(object.data) < 1000) {
      keyValueMap[object] = true;
    }
  }

  ///
  /// Performance-critical part: working with data, checking a result that was
  /// previously calculated
  ///
  final sw = Stopwatch();
  sw.start();
  for (var i = 0; i < objects.length; i++) {
    final object1 = objects[i];
    for (var j = 0; j < objects.length; j++) {
      if (i == j) continue;
      final object2 = objects[j];
      if (keyValueMap[object1] == keyValueMap[object2]) {
        // print('match!');
      }
    }
  }
  sw.stop();
  return sw.elapsedMicroseconds;
}

int mapAccessList(int objectsCount, bool growable) {
  ///
  /// Preparing data. No need to benchmark here
  ///
  final objects = MyObject.createObjects(objectsCount, growable);

  final valueList =
      List<bool>.filled(objects.length, false, growable: growable);
  for (var i = 0; i < objects.length; i++) {
    final object = objects[i];
    if (int.parse(object.data) < 1000) {
      valueList[i] = true;
    }
  }

  ///
  /// Performance-critical part: working with data, checking a result that was
  /// previously calculated
  ///
  final sw = Stopwatch();
  sw.start();
  for (var i = 0; i < objectsCount; i++) {
    for (var j = 0; j < objectsCount; j++) {
      if (i == j) continue;
      if (valueList[i] == valueList[j]) {
        // print('match!');
      }
    }
  }
  sw.stop();
  return sw.elapsedMicroseconds;
}

int mapAccessHashSetByIndex(int objectsCount) {
  ///
  /// Preparing data. No need to benchmark here
  ///
  final objects = MyObject.createObjects(objectsCount, true);

  final keyValueMap = <int, bool>{}; // <--- Key is integer, not object!!!
  for (var i = 0; i < objects.length; i++) {
    final object = objects[i];
    if (int.parse(object.data) < 1000) {
      keyValueMap[i] = true;
    }
  }

  ///
  /// Performance-critical part: working with data, checking a result that was
  /// previously calculated
  ///
  final sw = Stopwatch();
  sw.start();
  for (var i = 0; i < objects.length; i++) {
    for (var j = 0; j < objects.length; j++) {
      if (i == j) continue;
      if (keyValueMap[i] == keyValueMap[j]) {
        // any useful logic here
      }
    }
  }
  sw.stop();
  return sw.elapsedMicroseconds;
}
