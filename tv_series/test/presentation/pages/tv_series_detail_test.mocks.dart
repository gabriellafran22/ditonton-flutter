// Mocks generated by Mockito 5.0.17 from annotations
// in tv_series/test/presentation/pages/tv_series_detail_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:bloc/bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_series/tv_series.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeTvSeriesDetailRecommendationsState_0 extends _i1.Fake
    implements _i2.TvSeriesDetailRecommendationsState {}

/// A class which mocks [TvSeriesDetailRecommendationsCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesDetailRecommendationsCubit extends _i1.Mock
    implements _i2.TvSeriesDetailRecommendationsCubit {
  MockTvSeriesDetailRecommendationsCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TvSeriesDetailRecommendationsState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeTvSeriesDetailRecommendationsState_0())
          as _i2.TvSeriesDetailRecommendationsState);
  @override
  _i3.Stream<_i2.TvSeriesDetailRecommendationsState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue:
                  Stream<_i2.TvSeriesDetailRecommendationsState>.empty())
          as _i3.Stream<_i2.TvSeriesDetailRecommendationsState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  _i3.Future<void> getTvSeriesDetailRecommendations(int? id) => (super
      .noSuchMethod(Invocation.method(#getTvSeriesDetailRecommendations, [id]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void emit(_i2.TvSeriesDetailRecommendationsState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void onChange(_i4.Change<_i2.TvSeriesDetailRecommendationsState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}