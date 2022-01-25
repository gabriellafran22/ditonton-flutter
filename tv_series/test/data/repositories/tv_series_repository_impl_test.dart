import 'dart:io';

import 'package:core/data/models/genre_model.dart';
import 'package:core/utils/exception.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/data/models/tv_series_detail_model.dart';
import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/data/repositories/tv_series_repository_impl.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TVSeriesRepositoryImpl repository;
  late MockTVSeriesRemoteDataSource mockRemoteDataSource;
  late MockTVSeriesLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTVSeriesRemoteDataSource();
    mockLocalDataSource = MockTVSeriesLocalDataSource();
    repository = TVSeriesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  const tTVSeriesModel = TVSeriesModel(
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
    id: 1,
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    voteAverage: 1.0,
    voteCount: 1,
    originalLanguage: "en",
    originCountry: ["US"],
    firstAirDate: "firstAirDate",
    originalName: "originalName",
    name: "name",
  );

  final tTVSeries = TVSeries(
    backdropPath: '/path.jpg',
    genreIds: const [1, 2, 3, 4],
    id: 1,
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    voteAverage: 1.0,
    voteCount: 1,
    originalLanguage: "en",
    originCountry: const ["US"],
    firstAirDate: "firstAirDate",
    originalName: "originalName",
    name: "name",
  );

  final tTVSeriesModelList = <TVSeriesModel>[tTVSeriesModel];
  final tTVSeriesList = <TVSeries>[tTVSeries];

  group('Now Playing TV Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTVSeries())
          .thenAnswer((_) async => tTVSeriesModelList);
      // act
      final result = await repository.getNowPlayingTVSeries();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTVSeries());
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVSeriesList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTVSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getNowPlayingTVSeries();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTVSeries());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getNowPlayingTVSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getNowPlayingTVSeries();
      // assert
      verify(mockRemoteDataSource.getNowPlayingTVSeries());
      expect(result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular TV Series', () {
    test('should return TV Series list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTVSeries())
          .thenAnswer((_) async => tTVSeriesModelList);
      // act
      final result = await repository.getPopularTVSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVSeriesList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTVSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTVSeries();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTVSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTVSeries();
      // assert
      expect(
          result, const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated TV Series', () {
    test('should return TV Series list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTVSeries())
          .thenAnswer((_) async => tTVSeriesModelList);
      // act
      final result = await repository.getTopRatedTVSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTVSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTVSeries();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTVSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedTVSeries();
      // assert
      expect(
          result, const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get TV Series Detail', () {
    const tId = 1;
    const tTVSeriesResponse = TVSeriesDetailResponse(
      adult: false,
      backdropPath: 'backdropPath',
      genres: [GenreModel(id: 18, name: 'Drama')],
      id: 4,
      overview: 'overview',
      posterPath: 'posterPath',
      voteAverage: 7.5,
      voteCount: 4,
      lastAirDate: 'lastAirDate',
      originCountry: ["GB"],
      createdBy: [],
      numberOfEpisodes: 6,
      tagline: 'tagline',
      originalLanguage: 'en',
      firstAirDate: 'firstAirDate',
      productionCompanies: [],
      numberOfSeasons: 1,
      inProduction: false,
      episodeRunTime: [60],
      status: 'status',
      originalName: 'originalName',
      type: 'type',
      popularity: 2.944,
      name: 'name',
      homepage: 'homepage',
      languages: ["en"],
    );

    test(
        'should return TV Series data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVSeriesDetail(tId))
          .thenAnswer((_) async => tTVSeriesResponse);
      // act
      final result = await repository.getTVSeriesDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTVSeriesDetail(tId));
      expect(result, equals(const Right(testTVSeriesDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVSeriesDetail(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTVSeriesDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTVSeriesDetail(tId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVSeriesDetail(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTVSeriesDetail(tId);
      // assert
      verify(mockRemoteDataSource.getTVSeriesDetail(tId));
      expect(result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get TV Series Recommendations', () {
    final tTVSeriesList = <TVSeriesModel>[];
    const tId = 1;

    test('should return data (TV Series list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVSeriesRecommendations(tId))
          .thenAnswer((_) async => tTVSeriesList);
      // act
      final result = await repository.getTVSeriesRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTVSeriesRecommendations(tId));
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTVSeriesList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVSeriesRecommendations(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTVSeriesRecommendations(tId);
      // assertbuild runner
      verify(mockRemoteDataSource.getTVSeriesRecommendations(tId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTVSeriesRecommendations(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTVSeriesRecommendations(tId);
      // assert
      verify(mockRemoteDataSource.getTVSeriesRecommendations(tId));
      expect(result,
          equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Search TV Series', () {
    const tQuery = 'Suits';

    test('should return TV Series list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTVSeries(tQuery))
          .thenAnswer((_) async => tTVSeriesModelList);
      // act
      final result = await repository.searchTVSeries(tQuery);
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTVSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTVSeries(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTVSeries(tQuery);
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTVSeries(tQuery))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTVSeries(tQuery);
      // assert
      expect(
          result, const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('get get_watchlist_movies status TV Series', () {
    test('should return watch status whether data is found', () async {
      // arrange
      const tId = 1;
      when(mockLocalDataSource.getTVSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTVSeries(tId);
      // assert
      expect(result, false);
    });
  });

  group('get get_watchlist_movies TV Series', () {
    test('should return list of Movies', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTVSeries())
          .thenAnswer((_) async => [testTVSeriesTable]);
      // act
      final result = await repository.getWatchlistTVSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTVSeries]);
    });
  });
}
