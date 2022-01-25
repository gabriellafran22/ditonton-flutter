import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';

class GetNowPlayingTVSeries {
  final TVSeriesRepository repository;

  GetNowPlayingTVSeries(this.repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getNowPlayingTVSeries();
  }
}
