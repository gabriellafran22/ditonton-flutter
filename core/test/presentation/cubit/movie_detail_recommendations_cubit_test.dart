import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_detail_recommendations_cubit_test.mocks.dart';


@GenerateMocks([GetMovieRecommendations])
void main() {
  late MovieDetailRecommendationsCubit movieDetailRecommendationsCubit;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  const tId = 1;

  setUp(() {
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    movieDetailRecommendationsCubit = MovieDetailRecommendationsCubit(mockGetMovieRecommendations);
  });

  test('initial state should be empty', () {
    expect(movieDetailRecommendationsCubit.state, MovieDetailRecommendationsEmpty());
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );
  final tMovieList = <Movie>[tMovieModel];

  blocTest<MovieDetailRecommendationsCubit, MovieDetailRecommendationsState>(
    'Should emit [Loading, HasData] when data of movie recommendations is gotten successfully',
    build: () {
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Right(tMovieList));
      return movieDetailRecommendationsCubit;
    },
    act: (cubit) => cubit.getMovieDetailRecommendations(tId),
    expect: () => [
      MovieDetailRecommendationsLoading(),
      MovieDetailRecommendationsHasData(tMovieList),
    ],
    verify: (cubit) {
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );

  blocTest<MovieDetailRecommendationsCubit, MovieDetailRecommendationsState>(
    'Should emit [Loading, Error] when get get movie recommendations movies is unsuccessful',
    build: () {
      when(mockGetMovieRecommendations.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return movieDetailRecommendationsCubit;
    },
    act: (cubit) => cubit.getMovieDetailRecommendations(tId),
    expect: () => [
      MovieDetailRecommendationsLoading(),
      const MovieDetailRecommendationsError('Server Failure'),
    ],
    verify: (cubit) {
      verify(mockGetMovieRecommendations.execute(tId));
    },
  );
}
