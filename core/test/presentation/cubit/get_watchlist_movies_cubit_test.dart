import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:core/domain/usecases/get_watchlist_movies.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_watchlist_movies_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late GetWatchlistMoviesCubit getWatchlistMoviesCubit;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    getWatchlistMoviesCubit = GetWatchlistMoviesCubit(mockGetWatchlistMovies);
  });

  final tMovieModel = Movie(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: const [14, 28],
    id: 557,
    originalTitle: 'Spider-Man',
    overview:
    'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    releaseDate: '2002-05-01',
    title: 'Spider-Man',
    video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tMovieList = <Movie>[tMovieModel];

  blocTest<GetWatchlistMoviesCubit, GetWatchlistMoviesState>(
      'should change movies data when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Right(tMovieList));
      return getWatchlistMoviesCubit;
    },
    act: (cubit) => cubit.getWatchlistMovies(),
    expect: () => [
      GetWatchlistMoviesLoading(),
      GetWatchlistMoviesHasData(tMovieList),
    ],
    verify: (cubit) {
      verify(mockGetWatchlistMovies.execute());
    },
  );

  blocTest<GetWatchlistMoviesCubit, GetWatchlistMoviesState>(
      'should return error when data is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute())
          .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
      return getWatchlistMoviesCubit;
    },
    act: (cubit) => cubit.getWatchlistMovies(),
    expect: () => [
      GetWatchlistMoviesLoading(),
      const GetWatchlistMoviesError("Can't get data"),
    ],
    verify: (cubit) {
      verify(mockGetWatchlistMovies.execute());
    },
  );

}
