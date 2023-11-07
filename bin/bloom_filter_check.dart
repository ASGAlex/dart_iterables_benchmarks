import 'package:map_vs_list_benchmark/set_vs_bloom_filter.dart';

const elementsCount = 10000000;

void main(List<String> arguments) {
  var ms = bloomCheck(elementsCount);
  printResults(elementsCount, ms);
}
