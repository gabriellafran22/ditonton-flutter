import 'dart:convert';

import 'package:core/utils/constants.dart';
import 'package:core/utils/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';


void main() {
  late TVSeriesRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TVSeriesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Now Playing TVSeries', () {
    final tTVSeriesList = TVSeriesResponse.fromJson(
        json.decode(readJson('dummy_data/now_playing_tv_series.json')))
        .tvSeriesList;

    test('should return list of TVSeries Model when the response code is 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/now_playing_tv_series.json'), 200));
          // act
          final result = await dataSource.getNowPlayingTVSeries();
          // assert
          expect(result, equals(tTVSeriesList));
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/on_the_air?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getNowPlayingTVSeries();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Popular TVSeries', () {
    final tTVSeriesList =
        TVSeriesResponse.fromJson(json.decode(readJson('dummy_data/popular_tv_series.json')))
            .tvSeriesList;

    test('should return list of TVSeries when response is success (200)',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
              .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/popular_tv_series.json'), 200));
          // act
          final result = await dataSource.getPopularTVSeries();
          // assert
          expect(result, tTVSeriesList);
        });

    test(
        'should throw a ServerException when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$baseUrl/tv/popular?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getPopularTVSeries();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get Top Rated TV Series', () {
    final tTVSeriesList = TVSeriesResponse.fromJson(
        json.decode(readJson('dummy_data/top_rated_tv_series.json')))
        .tvSeriesList;

    test('should return list of TV Series when response code is 200 ', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/top_rated_tv_series.json'), 200));
      // act
      final result = await dataSource.getTopRatedTVSeries();
      // assert
      expect(result, tTVSeriesList);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$baseUrl/tv/top_rated?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getTopRatedTVSeries();
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get TV Series detail', () {
    const tId = 1;
    final tTVSeriesDetail = TVSeriesDetailResponse.fromJson(
        json.decode(readJson('dummy_data/tv_series_detail.json')));

    test('should return movie detail when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
          .thenAnswer((_) async =>
          http.Response(readJson('dummy_data/tv_series_detail.json'), 200));
      // act
      final result = await dataSource.getTVSeriesDetail(tId);
      // assert
      expect(result, equals(tTVSeriesDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient.get(Uri.parse('$baseUrl/tv/$tId?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getTVSeriesDetail(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('get TV Series recommendations', () {
    final tTVSeriesList = TVSeriesResponse.fromJson(
        json.decode(readJson('dummy_data/tv_series_recommendations.json')))
        .tvSeriesList;
    const tId = 2;

    test('should return list of TVSeriesModel when the response code is 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')))
              .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series_recommendations.json'), 200));
          // act
          final result = await dataSource.getTVSeriesRecommendations(tId);
          // assert
          expect(result, equals(tTVSeriesList));
        });

    test('should throw Server Exception when the response code is 404 or other',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/tv/$tId/recommendations?$apiKey')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.getTVSeriesRecommendations(tId);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });

  group('search TV Series', () {
    final tSearchResult = TVSeriesResponse.fromJson(
        json.decode(readJson('dummy_data/search_suits_tv_series.json')))
        .tvSeriesList;
    const tQuery = 'Suits';

    test('should return list of TV Series when response code is 200', () async {
      // arrange
      when(mockHttpClient
          .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
          readJson('dummy_data/search_suits_tv_series.json'), 200));
      // act
      final result = await dataSource.searchTVSeries(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
            () async {
          // arrange
          when(mockHttpClient
              .get(Uri.parse('$baseUrl/search/tv?$apiKey&query=$tQuery')))
              .thenAnswer((_) async => http.Response('Not Found', 404));
          // act
          final call = dataSource.searchTVSeries(tQuery);
          // assert
          expect(() => call, throwsA(isA<ServerException>()));
        });
  });
}