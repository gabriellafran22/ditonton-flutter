// Mocks generated by Mockito 5.0.17 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i12;
import 'dart:typed_data' as _i13;

import 'package:core/core.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies/data/models/movie_table.dart' as _i8;
import 'package:sqflite_sqlcipher/sqflite.dart' as _i7;
import 'package:tv_series/data/models/tv_series_table.dart' as _i9;
import 'package:tv_series/domain/entities/tv_series.dart' as _i10;
import 'package:tv_series/domain/entities/tv_series_detail.dart' as _i11;
import 'package:tv_series/tv_series.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTVSeriesDetailResponse_1 extends _i1.Fake
    implements _i3.TVSeriesDetailResponse {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i5.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i7.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i7.Database?>.value()) as _i6.Future<_i7.Database?>);
  @override
  _i6.Future<int> insertWatchlistMovie(_i8.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistMovie(_i8.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
  @override
  _i6.Future<int> insertWatchlistTVSeries(_i9.TVSeriesTable? tvSeries) => (super
      .noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tvSeries]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTVSeries(_i9.TVSeriesTable? tvSeries) => (super
      .noSuchMethod(Invocation.method(#removeWatchlistTVSeries, [tvSeries]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTVSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [TVSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesRepository extends _i1.Mock
    implements _i3.TVSeriesRepository {
  MockTVSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>
      getNowPlayingTVSeries() => (super.noSuchMethod(
              Invocation.method(#getNowPlayingTVSeries, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i10.TVSeries>>()))
          as _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>
      getPopularTVSeries() => (super.noSuchMethod(
              Invocation.method(#getPopularTVSeries, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i10.TVSeries>>()))
          as _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>
      getTopRatedTVSeries() => (super.noSuchMethod(
              Invocation.method(#getTopRatedTVSeries, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i10.TVSeries>>()))
          as _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, _i11.TVSeriesDetail>> getTVSeriesDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesDetail, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i11.TVSeriesDetail>>.value(
                      _FakeEither_0<_i5.Failure, _i11.TVSeriesDetail>()))
          as _i6.Future<_i2.Either<_i5.Failure, _i11.TVSeriesDetail>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>
      getTVSeriesRecommendations(int? id) => (super.noSuchMethod(
              Invocation.method(#getTVSeriesRecommendations, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i10.TVSeries>>()))
          as _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i10.TVSeries>>()))
          as _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, String>> saveWatchlistTVSeries(
          _i11.TVSeriesDetail? tvSeries) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTVSeries, [tvSeries]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i6.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, String>> removeWatchlistTVSeries(
          _i11.TVSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
              Invocation.method(#removeWatchlistTVSeries, [tvSeries]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i6.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlistTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTVSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>
      getWatchlistTVSeries() => (super.noSuchMethod(
              Invocation.method(#getWatchlistTVSeries, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i10.TVSeries>>()))
          as _i6.Future<_i2.Either<_i5.Failure, List<_i10.TVSeries>>>);
}

/// A class which mocks [TVSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesRemoteDataSource extends _i1.Mock
    implements _i3.TVSeriesRemoteDataSource {
  MockTVSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i3.TVSeriesModel>> getNowPlayingTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingTVSeries, []),
              returnValue:
                  Future<List<_i3.TVSeriesModel>>.value(<_i3.TVSeriesModel>[]))
          as _i6.Future<List<_i3.TVSeriesModel>>);
  @override
  _i6.Future<List<_i3.TVSeriesModel>> getPopularTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
              returnValue:
                  Future<List<_i3.TVSeriesModel>>.value(<_i3.TVSeriesModel>[]))
          as _i6.Future<List<_i3.TVSeriesModel>>);
  @override
  _i6.Future<List<_i3.TVSeriesModel>> getTopRatedTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
              returnValue:
                  Future<List<_i3.TVSeriesModel>>.value(<_i3.TVSeriesModel>[]))
          as _i6.Future<List<_i3.TVSeriesModel>>);
  @override
  _i6.Future<_i3.TVSeriesDetailResponse> getTVSeriesDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesDetail, [id]),
              returnValue: Future<_i3.TVSeriesDetailResponse>.value(
                  _FakeTVSeriesDetailResponse_1()))
          as _i6.Future<_i3.TVSeriesDetailResponse>);
  @override
  _i6.Future<List<_i3.TVSeriesModel>> getTVSeriesRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesRecommendations, [id]),
              returnValue:
                  Future<List<_i3.TVSeriesModel>>.value(<_i3.TVSeriesModel>[]))
          as _i6.Future<List<_i3.TVSeriesModel>>);
  @override
  _i6.Future<List<_i3.TVSeriesModel>> searchTVSeries(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue:
                  Future<List<_i3.TVSeriesModel>>.value(<_i3.TVSeriesModel>[]))
          as _i6.Future<List<_i3.TVSeriesModel>>);
}

/// A class which mocks [TVSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesLocalDataSource extends _i1.Mock
    implements _i3.TVSeriesLocalDataSource {
  MockTVSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTVSeries(_i9.TVSeriesTable? tvSeries) =>
      (super.noSuchMethod(
          Invocation.method(#insertWatchlistTVSeries, [tvSeries]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTVSeries(_i9.TVSeriesTable? tvSeries) =>
      (super.noSuchMethod(
          Invocation.method(#removeWatchlistTVSeries, [tvSeries]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i9.TVSeriesTable?> getTVSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesById, [id]),
              returnValue: Future<_i9.TVSeriesTable?>.value())
          as _i6.Future<_i9.TVSeriesTable?>);
  @override
  _i6.Future<List<_i9.TVSeriesTable>> getWatchlistTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
              returnValue:
                  Future<List<_i9.TVSeriesTable>>.value(<_i9.TVSeriesTable>[]))
          as _i6.Future<List<_i9.TVSeriesTable>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i12.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i6.Future<_i4.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i13.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i13.Uint8List>.value(_i13.Uint8List(0)))
          as _i6.Future<_i13.Uint8List>);
  @override
  _i6.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i6.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
