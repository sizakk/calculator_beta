// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data/data.dart';

double expPythagorean({
  required double run,
  required double earedRun,
}) {
  return (run * run * 100 / (run * run + earedRun * earedRun));
}

BinomialDistribution binormDist({
  required int n,
  required double p,
}) {
  return BinomialDistribution(n, p);
}
