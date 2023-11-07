import 'package:map_vs_list_benchmark/map_vs_list_benchmark.dart';

const elementsCount = 10000;

void main(List<String> arguments) {
  var ms = mapAccessList(elementsCount, true);
  printResults(elementsCount, ms);
}
