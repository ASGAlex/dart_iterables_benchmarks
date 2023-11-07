import 'dart:math';

import 'package:dart_bloom_filter/dart_bloom_filter.dart';
import 'package:map_vs_list_benchmark/my_object.dart';

export 'package:map_vs_list_benchmark/my_object.dart';

int hashSetCheck(int elementsCount) {
  ///
  /// Preparing data. No need to benchmark here
  ///
  final objects = MyObject.createObjects(elementsCount, false);

  final random = Random();
  final objectsSet = <int>{};

  for (var i = 0; i < objects.length; i++) {
    if (random.nextBool()) {
      objectsSet.add(i);
    }
  }

  ///
  /// Performance-critical part: working with data, checking a result that was
  /// previously calculated
  ///
  final sw = Stopwatch();
  sw.start();
  for (var i = 0; i < objects.length; i++) {
    if (objectsSet.contains(i)) {
      // do something
    }
  }

  sw.stop();
  return sw.elapsedMicroseconds;
}

int bloomCheck(int elementsCount) {
  ///
  /// Preparing data. No need to benchmark here
  ///
  final objects = MyObject.createObjects(elementsCount, false);

  final random = Random();

  final bloomTrue = BloomFilter<int>(objects.length, 0.1);

  for (var i = 0; i < objects.length; i++) {
    if (random.nextBool()) {
      bloomTrue.add(item: i);
    }
  }

  ///
  /// Performance-critical part: working with data, checking a result that was
  /// previously calculated
  ///
  final sw = Stopwatch();
  sw.start();
  for (var i = 0; i < objects.length; i++) {
    if (bloomTrue.contains(item: i)) {
      // do something
    }
  }
  sw.stop();
  return sw.elapsedMicroseconds;
}
