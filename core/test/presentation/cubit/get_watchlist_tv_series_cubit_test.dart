import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_watchlist_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistTVSeries])
void main() {
  late MockGetWatchlistTVSeries mockGetWatchlistTVSeries;
  late GetWatchlistTvSeriesCubit getWatchlistTvSeriesCubit;

  setUp(() {
    mockGetWatchlistTVSeries = MockGetWatchlistTVSeries();
    getWatchlistTvSeriesCubit = GetWatchlistTvSeriesCubit(mockGetWatchlistTVSeries);
  });

  final testTVSeries = TVSeries(
    backdropPath: '/oKt4J3TFjWirVwBqoHyIvv5IImd.jpg',
    genreIds: const [18],
    id: 85552,
    name: 'Euphoria',
    overview:
    'A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.',
    popularity: 5201.673,
    posterPath: '/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg',
    voteAverage: 8.4,
    voteCount: 5455,
    firstAirDate: '2019-06-16',
    originalLanguage: 'en',
    originalName: 'Euphoria',
    originCountry: const ['US'],
  );
  final tTvSeriesList = <TVSeries>[testTVSeries];

  blocTest<GetWatchlistTvSeriesCubit, GetWatchlistTvSeriesState>(
    'should change movies data when data is gotten successfully',
    build: () {
      when(mockGetWatchlistTVSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      return getWatchlistTvSeriesCubit;
    },
    act: (cubit) => cubit.getWatchlistTvSeries(),
    expect: () => [
      GetWatchlistTvSeriesLoading(),
      GetWatchlistTvSeriesHasData(tTvSeriesList),
    ],
    verify: (cubit) {
      verify(mockGetWatchlistTVSeries.execute());
    },
  );

  blocTest<GetWatchlistTvSeriesCubit, GetWatchlistTvSeriesState>(
    'should return error when data is unsuccessful',
    build: () {
      when(mockGetWatchlistTVSeries.execute())
          .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
      return getWatchlistTvSeriesCubit;
    },
    act: (cubit) => cubit.getWatchlistTvSeries(),
    expect: () => [
      GetWatchlistTvSeriesLoading(),
      const GetWatchlistTvSeriesError("Can't get data"),
    ],
    verify: (cubit) {
      verify(mockGetWatchlistTVSeries.execute());
    },
  );

}
