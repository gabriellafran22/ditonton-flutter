import 'package:core/core.dart';

class GetWatchListStatusTVSeries {
  final TVSeriesRepository repository;


  GetWatchListStatusTVSeries(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTVSeries(id);
  }
}
