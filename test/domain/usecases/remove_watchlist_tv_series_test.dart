import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = RemoveWatchlistTVSeries(mockTVSeriesRepository);
  });

  test('should remove get_watchlist_movies TV Series from repository', () async {
    // arrange
    when(mockTVSeriesRepository.removeWatchlistTVSeries(testTVSeriesDetail))
        .thenAnswer((_) async => Right('Removed from get_watchlist_movies'));
    // act
    final result = await usecase.execute(testTVSeriesDetail);
    // assert
    verify(mockTVSeriesRepository.removeWatchlistTVSeries(testTVSeriesDetail));
    expect(result, Right('Removed from get_watchlist_movies'));
  });
}
