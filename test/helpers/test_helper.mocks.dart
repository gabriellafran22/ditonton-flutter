// Mocks generated by Mockito 5.0.17 from annotations
// in ditonton/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:convert' as _i8;
import 'dart:typed_data' as _i9;

import 'package:core/core.dart' as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite_sqlcipher/sqflite.dart' as _i6;
import 'package:tv_series/data/models/tv_series_table.dart' as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeMovieDetailResponse_1 extends _i1.Fake
    implements _i3.MovieDetailResponse {}

class _FakeResponse_2 extends _i1.Fake implements _i4.Response {}

class _FakeStreamedResponse_3 extends _i1.Fake implements _i4.StreamedResponse {
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(Invocation.method(#getPopularMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, _i3.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, _i3.MovieDetail>>.value(
              _FakeEither_0<_i3.Failure, _i3.MovieDetail>())) as _i5
          .Future<_i2.Either<_i3.Failure, _i3.MovieDetail>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> saveWatchlist(
          _i3.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, String>> removeWatchlist(
          _i3.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlist, [movie]),
              returnValue: Future<_i2.Either<_i3.Failure, String>>.value(
                  _FakeEither_0<_i3.Failure, String>()))
          as _i5.Future<_i2.Either<_i3.Failure, String>>);
  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlist, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
  @override
  _i5.Future<_i2.Either<_i3.Failure, List<_i3.Movie>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>.value(
              _FakeEither_0<_i3.Failure, List<_i3.Movie>>())) as _i5
          .Future<_i2.Either<_i3.Failure, List<_i3.Movie>>>);
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i3.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.MovieModel>> getNowPlayingMovies() => (super.noSuchMethod(
          Invocation.method(#getNowPlayingMovies, []),
          returnValue: Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
      as _i5.Future<List<_i3.MovieModel>>);
  @override
  _i5.Future<List<_i3.MovieModel>> getPopularMovies() => (super.noSuchMethod(
          Invocation.method(#getPopularMovies, []),
          returnValue: Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
      as _i5.Future<List<_i3.MovieModel>>);
  @override
  _i5.Future<List<_i3.MovieModel>> getTopRatedMovies() => (super.noSuchMethod(
          Invocation.method(#getTopRatedMovies, []),
          returnValue: Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
      as _i5.Future<List<_i3.MovieModel>>);
  @override
  _i5.Future<_i3.MovieDetailResponse> getMovieDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieDetail, [id]),
              returnValue: Future<_i3.MovieDetailResponse>.value(
                  _FakeMovieDetailResponse_1()))
          as _i5.Future<_i3.MovieDetailResponse>);
  @override
  _i5.Future<List<_i3.MovieModel>> getMovieRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieRecommendations, [id]),
              returnValue:
                  Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i5.Future<List<_i3.MovieModel>>);
  @override
  _i5.Future<List<_i3.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchMovies, [query]),
              returnValue:
                  Future<List<_i3.MovieModel>>.value(<_i3.MovieModel>[]))
          as _i5.Future<List<_i3.MovieModel>>);
}

/// A class which mocks [MovieLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieLocalDataSource extends _i1.Mock
    implements _i3.MovieLocalDataSource {
  MockMovieLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> insertWatchlistMovie(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistMovie, [movie]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<String> removeWatchlistMovie(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistMovie, [movie]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i3.MovieTable?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<_i3.MovieTable?>.value())
          as _i5.Future<_i3.MovieTable?>);
  @override
  _i5.Future<List<_i3.MovieTable>> getWatchlistMovies() => (super.noSuchMethod(
          Invocation.method(#getWatchlistMovies, []),
          returnValue: Future<List<_i3.MovieTable>>.value(<_i3.MovieTable>[]))
      as _i5.Future<List<_i3.MovieTable>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i3.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i6.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i6.Database?>.value()) as _i5.Future<_i6.Database?>);
  @override
  _i5.Future<int> insertWatchlistMovie(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#insertWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeWatchlistMovie(_i3.MovieTable? movie) =>
      (super.noSuchMethod(Invocation.method(#removeWatchlistMovie, [movie]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getMovieById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistMovies() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistMovies, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
  @override
  _i5.Future<int> insertWatchlistTVSeries(_i7.TVSeriesTable? tvSeries) => (super
      .noSuchMethod(Invocation.method(#insertWatchlistTVSeries, [tvSeries]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<int> removeWatchlistTVSeries(_i7.TVSeriesTable? tvSeries) => (super
      .noSuchMethod(Invocation.method(#removeWatchlistTVSeries, [tvSeries]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<Map<String, dynamic>?> getTVSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i5.Future<Map<String, dynamic>?>);
  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistTVSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i5.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i4.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<_i4.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i4.Response>.value(_FakeResponse_2()))
          as _i5.Future<_i4.Response>);
  @override
  _i5.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i9.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i9.Uint8List>.value(_i9.Uint8List(0)))
          as _i5.Future<_i9.Uint8List>);
  @override
  _i5.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3()))
          as _i5.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}
