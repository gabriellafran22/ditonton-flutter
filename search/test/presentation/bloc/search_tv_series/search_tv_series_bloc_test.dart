import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/presentation/bloc/search_tv_series/search_tv_series_bloc.dart';
import 'package:search/search.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

import 'search_tv_series_bloc_test.mocks.dart';

@GenerateMocks([SearchTVSeries])
void main() {
  late SearchTvSeriesBloc searchBloc;
  late MockSearchTVSeries mockSearchTVSeries;

  setUp(() {
    mockSearchTVSeries = MockSearchTVSeries();
    searchBloc = SearchTvSeriesBloc(mockSearchTVSeries);
  });

  test('initial state should be empty', () {
    expect(searchBloc.state, SearchTVSeriesEmpty());
  });

  final tTVSeriesModel = TVSeries(
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
  final tTVSeriesList = <TVSeries>[tTVSeriesModel];
  const tQuery = 'euphoria';

  blocTest<SearchTvSeriesBloc, SearchTVSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTVSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tTVSeriesList));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChangedTVSeries(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTVSeriesLoading(),
      SearchTVSeriesHasData(tTVSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchTVSeries.execute(tQuery));
    },
  );

  blocTest<SearchTvSeriesBloc, SearchTVSeriesState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTVSeries.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return searchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryChangedTVSeries(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      SearchTVSeriesLoading(),
      const SearchTVSeriesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTVSeries.execute(tQuery));
    },
  );
}
