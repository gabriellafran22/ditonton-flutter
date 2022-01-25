import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';

class GetWatchlistTVSeries {
  final TVSeriesRepository _repository;

  GetWatchlistTVSeries(this._repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return _repository.getWatchlistTVSeries();
  }
}