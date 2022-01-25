import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_watchlist_cubit_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatusTVSeries,
  SaveWatchlistTVSeries,
  RemoveWatchlistTVSeries,
])
void main() {
  late TvSeriesWatchlistCubit movieWatchlistCubit;
  late MockGetWatchListStatusTVSeries mockGetWatchListStatus;
  late MockSaveWatchlistTVSeries mockSaveWatchlist;
  late MockRemoveWatchlistTVSeries mockRemoveWatchlist;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatusTVSeries();
    mockSaveWatchlist = MockSaveWatchlistTVSeries();
    mockRemoveWatchlist = MockRemoveWatchlistTVSeries();
    movieWatchlistCubit = TvSeriesWatchlistCubit(
        mockGetWatchListStatus, mockSaveWatchlist, mockRemoveWatchlist);
  });

  test('initial state should be empty', () {
    expect(movieWatchlistCubit.state, TvSeriesWatchlistState(false));
  });

  blocTest<TvSeriesWatchlistCubit, TvSeriesWatchlistState>(
    'Should emit get_watchlist_movies status',
    build: () {
      when(mockGetWatchListStatus.execute(1)).thenAnswer((_) async => true);
      return movieWatchlistCubit;
    },
    act: (cubit) => cubit.loadWatchlistStatus(1),
    expect: () => [
      TvSeriesWatchlistState(true),
    ],
    verify: (cubit) {
      verify(mockGetWatchListStatus.execute(1));
    },
  );

  blocTest<TvSeriesWatchlistCubit, TvSeriesWatchlistState>(
    'Should emit add to get_watchlist_movies',
    build: () {
      when(mockSaveWatchlist.execute(testTVSeriesDetail))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetWatchListStatus.execute(testTVSeriesDetail.id))
          .thenAnswer((_) async => true);
      return movieWatchlistCubit;
    },
    act: (cubit) => cubit.addWatchlist(testTVSeriesDetail),
    expect: () => [
      TvSeriesWatchlistState(true),
    ],
    verify: (cubit) {
      verify(mockSaveWatchlist.execute(testTVSeriesDetail));
      verify(mockGetWatchListStatus.execute(testTVSeriesDetail.id));
    },
  );

  blocTest<TvSeriesWatchlistCubit, TvSeriesWatchlistState>(
    'Should emit remove from get_watchlist_movies',
    build: () {
      when(mockRemoveWatchlist.execute(testTVSeriesDetail))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetWatchListStatus.execute(testTVSeriesDetail.id))
          .thenAnswer((_) async => false);
      return movieWatchlistCubit;
    },
    act: (cubit) => cubit.removeFromWatchlist(testTVSeriesDetail),
    expect: () => [
      TvSeriesWatchlistState(false),
    ],
    verify: (cubit) {
      verify(mockRemoveWatchlist.execute(testTVSeriesDetail));
      verify(mockGetWatchListStatus.execute(testTVSeriesDetail.id));
    },
  );
}
