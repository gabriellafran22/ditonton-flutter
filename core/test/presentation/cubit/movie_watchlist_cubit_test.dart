import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy/dummy_objects.dart';
import 'movie_watchlist_cubit_test.mocks.dart';

@GenerateMocks([
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MovieWatchlistCubit movieWatchlistCubit;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  setUp(() {
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    movieWatchlistCubit = MovieWatchlistCubit(
        mockGetWatchListStatus, mockSaveWatchlist, mockRemoveWatchlist);
  });

  test('initial state should be empty', () {
    expect(movieWatchlistCubit.state, MovieWatchlistState(false));
  });

  blocTest<MovieWatchlistCubit, MovieWatchlistState>(
    'Should emit get_watchlist_movies status',
    build: () {
      when(mockGetWatchListStatus.execute(1)).thenAnswer((_) async => true);
      return movieWatchlistCubit;
    },
    act: (cubit) => cubit.loadWatchlistStatus(1),
    expect: () => [
      MovieWatchlistState(true),
    ],
    verify: (cubit) {
      verify(mockGetWatchListStatus.execute(1));
    },
  );

  blocTest<MovieWatchlistCubit, MovieWatchlistState>(
    'Should emit add to get_watchlist_movies',
    build: () {
      when(mockSaveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Success'));
      when(mockGetWatchListStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => true);
      return movieWatchlistCubit;
    },
    act: (cubit) => cubit.addWatchlist(testMovieDetail),
    expect: () => [
      MovieWatchlistState(true),
    ],
    verify: (cubit) {
      verify(mockSaveWatchlist.execute(testMovieDetail));
      verify(mockGetWatchListStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieWatchlistCubit, MovieWatchlistState>(
    'Should emit remove from get_watchlist_movies',
    build: () {
      when(mockRemoveWatchlist.execute(testMovieDetail))
          .thenAnswer((_) async => const Right('Removed'));
      when(mockGetWatchListStatus.execute(testMovieDetail.id))
          .thenAnswer((_) async => false);
      return movieWatchlistCubit;
    },
    act: (cubit) => cubit.removeFromWatchlist(testMovieDetail),
    expect: () => [
      MovieWatchlistState(false),
    ],
    verify: (cubit) {
      verify(mockRemoveWatchlist.execute(testMovieDetail));
      verify(mockGetWatchListStatus.execute(testMovieDetail.id));
    },
  );


}
