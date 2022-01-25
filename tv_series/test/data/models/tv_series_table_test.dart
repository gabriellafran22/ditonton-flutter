import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/tv_series_table.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

void main() {
  const testTVSeriesTable = TVSeriesTable(
    id: 1,
    name: 'name',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  final tTVSeries = TVSeries.watchlist(
    id: 1,
    name: 'name',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  test('should be a subclass of TV Series Table entity', () async {
    final result = testTVSeriesTable.toEntity();
    expect(result, tTVSeries);
  });
}
