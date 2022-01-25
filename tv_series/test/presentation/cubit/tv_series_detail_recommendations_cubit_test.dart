import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:tv_series/presentation/cubit/tv_series_detail_recommendations/tv_series_detail_recommendations_cubit.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_recommendations_cubit_test.mocks.dart';

@GenerateMocks([GetTVSeriesRecommendations])
void main() {
  late TvSeriesDetailRecommendationsCubit tvSeriesDetailRecommendationsCubit;
  late MockGetTVSeriesRecommendations mockGetTVSeriesRecommendations;

  setUp(() {
    mockGetTVSeriesRecommendations = MockGetTVSeriesRecommendations();
    tvSeriesDetailRecommendationsCubit =
        TvSeriesDetailRecommendationsCubit(mockGetTVSeriesRecommendations);
  });

  final testTVSeriesRecommendations = TVSeries(
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
  final tTvSeriesListRecommendations = <TVSeries>[testTVSeriesRecommendations];

  test('initial state should be empty', () {
    expect(tvSeriesDetailRecommendationsCubit.state, TvSeriesDetailRecommendationsEmpty());
  });

  const tId = 1;

  blocTest<TvSeriesDetailRecommendationsCubit,
      TvSeriesDetailRecommendationsState>(
    'Should emit [Loading, HasData] when data of tvSeries detail is gotten successfully',
    build: () {
      when(mockGetTVSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tTvSeriesListRecommendations));
      return tvSeriesDetailRecommendationsCubit;
    },
    act: (cubit) => cubit.getTvSeriesDetailRecommendations(tId),
    expect: () => [
      TvSeriesDetailRecommendationsLoading(),
      TvSeriesDetailRecommendationsHasData(testTVSeriesList),
    ],
    verify: (cubit) {
      verify(mockGetTVSeriesRecommendations.execute(tId));
    },
  );

  blocTest<TvSeriesDetailRecommendationsCubit,
      TvSeriesDetailRecommendationsState>(
    'Should emit [Loading, Error] when get get tvSeries detail is unsuccessful',
    build: () {
      when(mockGetTVSeriesRecommendations.execute(tId))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvSeriesDetailRecommendationsCubit;
    },
    act: (cubit) => cubit.getTvSeriesDetailRecommendations(tId),
    expect: () => [
      TvSeriesDetailRecommendationsLoading(),
      const TvSeriesDetailRecommendationsError('Server Failure'),
    ],
    verify: (cubit) {
      verify(mockGetTVSeriesRecommendations.execute(tId));
    },
  );
}
