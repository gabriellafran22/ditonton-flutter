import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tv_series/presentation/cubit/top_rated_tv_series/top_rated_tv_series_cubit.dart';

import 'top_rated_tv_series_test.mocks.dart';

@GenerateMocks([GetTopRatedTVSeries])
void main() {
  late TopRatedTvSeriesCubit topRatedTvSeriesCubit;
  late MockGetTopRatedTVSeries mockTopRatedTvSeries;

  setUp(() {
    mockTopRatedTvSeries = MockGetTopRatedTVSeries();
    topRatedTvSeriesCubit = TopRatedTvSeriesCubit(mockTopRatedTvSeries);
  });

  test('initial state should be empty', () {
    expect(topRatedTvSeriesCubit.state, TopRatedTvSeriesEmpty());
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

  blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
    'Should emit [Loading, HasData] when data of topRated movies is gotten successfully',
    build: () {
      when(mockTopRatedTvSeries.execute())
          .thenAnswer((_) async => Right(tTvSeriesList));
      return topRatedTvSeriesCubit;
    },
    act: (cubit) => cubit.getTopRatedTvSeries(),
    expect: () => [
      TopRatedTvSeriesLoading(),
      TopRatedTvSeriesHasData(tTvSeriesList),
    ],
    verify: (cubit) {
      verify(mockTopRatedTvSeries.execute());
    },
  );

  blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
    'Should emit [Loading, Error] when get get topRated movies is unsuccessful',
    build: () {
      when(mockTopRatedTvSeries.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return topRatedTvSeriesCubit;
    },
    act: (cubit) => cubit.getTopRatedTvSeries(),
    expect: () => [
      TopRatedTvSeriesLoading(),
      const TopRatedTvSeriesError('Server Failure'),
    ],
    verify: (cubit) {
      verify(mockTopRatedTvSeries.execute());
    },
  );
}
