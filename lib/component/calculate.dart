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
  int n = 0;
  double p = 0.0;
  return BinomialDistribution(n, p);
}
