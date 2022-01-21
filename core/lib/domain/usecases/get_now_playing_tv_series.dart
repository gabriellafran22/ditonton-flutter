import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

class GetNowPlayingTVSeries {
  final TVSeriesRepository repository;

  GetNowPlayingTVSeries(this.repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getNowPlayingTVSeries();
  }
}
