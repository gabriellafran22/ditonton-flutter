import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class RemoveWatchlistTVSeries {
  final TVSeriesRepository repository;

  RemoveWatchlistTVSeries(this.repository);

  Future<Either<Failure, String>> execute(TVSeriesDetail tvSeries) {
    return repository.removeWatchlistTVSeries(tvSeries);
  }
}
