// Mocks generated by Mockito 5.0.17 from annotations
// in search/test/domain/usecases/search_tv_series_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:core/core.dart' as _i5;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_series/domain/entities/tv_series.dart' as _i6;
import 'package:tv_series/domain/entities/tv_series_detail.dart' as _i7;
import 'package:tv_series/domain/repositories/tv_series_repository.dart' as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [TVSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTVSeriesRepository extends _i1.Mock
    implements _i3.TVSeriesRepository {
  MockTVSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>
      getNowPlayingTVSeries() =>
          (super.noSuchMethod(Invocation.method(#getNowPlayingTVSeries, []),
                  returnValue:
                      Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>.value(
                          _FakeEither_0<_i5.Failure, List<_i6.TVSeries>>()))
              as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>
      getPopularTVSeries() =>
          (super.noSuchMethod(Invocation.method(#getPopularTVSeries, []),
                  returnValue:
                      Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>.value(
                          _FakeEither_0<_i5.Failure, List<_i6.TVSeries>>()))
              as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>
      getTopRatedTVSeries() =>
          (super.noSuchMethod(Invocation.method(#getTopRatedTVSeries, []),
                  returnValue:
                      Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>.value(
                          _FakeEither_0<_i5.Failure, List<_i6.TVSeries>>()))
              as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.TVSeriesDetail>> getTVSeriesDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTVSeriesDetail, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i7.TVSeriesDetail>>.value(
                      _FakeEither_0<_i5.Failure, _i7.TVSeriesDetail>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i7.TVSeriesDetail>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>
      getTVSeriesRecommendations(int? id) => (super.noSuchMethod(
              Invocation.method(#getTVSeriesRecommendations, [id]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVSeries>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>> searchTVSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTVSeries, [query]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.TVSeries>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> saveWatchlistTVSeries(
          _i7.TVSeriesDetail? tvSeries) =>
      (super.noSuchMethod(Invocation.method(#saveWatchlistTVSeries, [tvSeries]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> removeWatchlistTVSeries(
          _i7.TVSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
              Invocation.method(#removeWatchlistTVSeries, [tvSeries]),
              returnValue: Future<_i2.Either<_i5.Failure, String>>.value(
                  _FakeEither_0<_i5.Failure, String>()))
          as _i4.Future<_i2.Either<_i5.Failure, String>>);
  @override
  _i4.Future<bool> isAddedToWatchlistTVSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTVSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>
      getWatchlistTVSeries() =>
          (super.noSuchMethod(Invocation.method(#getWatchlistTVSeries, []),
                  returnValue:
                      Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>.value(
                          _FakeEither_0<_i5.Failure, List<_i6.TVSeries>>()))
              as _i4.Future<_i2.Either<_i5.Failure, List<_i6.TVSeries>>>);
}
