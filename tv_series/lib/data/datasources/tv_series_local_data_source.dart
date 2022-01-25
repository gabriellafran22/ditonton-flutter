import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';
abstract class TVSeriesLocalDataSource {
  Future<String> insertWatchlistTVSeries(TVSeriesTable tvSeries);
  Future<String> removeWatchlistTVSeries(TVSeriesTable tvSeries);
  Future<TVSeriesTable?> getTVSeriesById(int id);
  Future<List<TVSeriesTable>> getWatchlistTVSeries();
}

class TVSeriesLocalDataSourceImpl implements TVSeriesLocalDataSource {
  final DatabaseHelper databaseHelper;

  TVSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<TVSeriesTable?> getTVSeriesById(int id) async {
    final result = await databaseHelper.getTVSeriesById(id);
    if (result != null) {
      return TVSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TVSeriesTable>> getWatchlistTVSeries() async {
    final result = await databaseHelper.getWatchlistTVSeries();
    return result.map((data) => TVSeriesTable.fromMap(data)).toList();
  }

  @override
  Future<String> insertWatchlistTVSeries(TVSeriesTable tvSeries) async {
    try {
      await databaseHelper.insertWatchlistTVSeries(tvSeries);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTVSeries(TVSeriesTable tvSeries) async {
    try {
      await databaseHelper.removeWatchlistTVSeries(tvSeries);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
