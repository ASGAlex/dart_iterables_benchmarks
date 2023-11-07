import 'dart:math';

class MyObject {
  MyObject(this.data);

  String data;

  static List<MyObject> createObjects(int objectsCount, bool growable) {
    /// Где-то у нас лежит куча объектов. над которыми нужно проводить операции
    final random = Random();
    if (growable) {
      final objects = <MyObject>[];
      for (var i = 0; i < objectsCount; i++) {
        final data = random.nextInt(objectsCount).toString();
        objects.add(MyObject(data));
      }
      return objects;
    } else {
      final empty = MyObject((-1).toString());
      final objects = List.filled(objectsCount, empty);
      for (var i = 0; i < objectsCount; i++) {
        final data = random.nextInt(objectsCount).toString();
        objects[i] = MyObject(data);
      }
      return objects;
    }
  }
}

void printResults(int elementsCount, int ms) =>
    print('Access on $elementsCount elements took $ms microseconds');
