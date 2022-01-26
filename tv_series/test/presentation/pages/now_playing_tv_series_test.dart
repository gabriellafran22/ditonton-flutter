import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'now_playing_tv_series_test.mocks.dart';
import 'popular_tv_series_page_test.mocks.dart';
import 'top_rated_tv_series_test.mocks.dart';

@GenerateMocks([NowPlayingTvSeriesCubit])
void main() {
  late MockNowPlayingTvSeriesCubit mockNowPlayingTvSeriesCubit;
  late MockPopularTvSeriesCubit mockPopularTvSeriesCubit;
  late MockTopRatedTvSeriesCubit mockTopRatedTvSeriesCubit;

  setUp(() {
    mockNowPlayingTvSeriesCubit = MockNowPlayingTvSeriesCubit();
    mockPopularTvSeriesCubit = MockPopularTvSeriesCubit();
    mockTopRatedTvSeriesCubit = MockTopRatedTvSeriesCubit();
  });

  Widget _makeTestableWidgetNowPlaying() {
    return BlocProvider<NowPlayingTvSeriesCubit>.value(
      value: mockNowPlayingTvSeriesCubit,
      child: const MaterialApp(
        home: NowPlayingTvSeriesWidget(),
      ),
    );
  }

  Widget _makeTestableWidgetPopular() {
    return BlocProvider<PopularTvSeriesCubit>.value(
      value: mockPopularTvSeriesCubit,
      child: const MaterialApp(
        home: PopularTvSeriesWidget(),
      ),
    );
  }

  Widget _makeTestableWidgetTopRated() {
    return BlocProvider<TopRatedTvSeriesCubit>.value(
      value: mockTopRatedTvSeriesCubit,
      child: const MaterialApp(
        home: TopRatedTvSeriesWidget(),
      ),
    );
  }

  group('now playing widget test', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      final expected = NowPlayingTvSeriesLoading();

      when(mockNowPlayingTvSeriesCubit.state).thenReturn(expected);
      when(mockNowPlayingTvSeriesCubit.stream)
          .thenAnswer((_) => Stream.value(expected));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidgetNowPlaying());

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      final expected = NowPlayingTvSeriesHasData([testTVSeries, testTVSeries]);

      when(mockNowPlayingTvSeriesCubit.state).thenReturn(expected);
      when(mockNowPlayingTvSeriesCubit.stream)
          .thenAnswer((_) => Stream.value(expected));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidgetNowPlaying());

      expect(listViewFinder, findsOneWidget);
      expect(find.byType(TVSeriesList), findsOneWidget);
    });
  });

  group('popular widget test', () {
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      final expected = PopularTvSeriesLoading();

      when(mockPopularTvSeriesCubit.state).thenReturn(expected);
      when(mockPopularTvSeriesCubit.stream)
          .thenAnswer((_) => Stream.value(expected));

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidgetPopular());

      expect(centerFinder, findsOneWidget);
      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      final expected = PopularTvSeriesHasData([testTVSeries, testTVSeries]);

      when(mockPopularTvSeriesCubit.state).thenReturn(expected);
      when(mockPopularTvSeriesCubit.stream)
          .thenAnswer((_) => Stream.value(expected));

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidgetPopular());

      expect(listViewFinder, findsOneWidget);
      expect(find.byType(TVSeriesList), findsOneWidget);
    });
  });

  group('top rated widget test', () {
    testWidgets('Page should display center progress bar when loading',
            (WidgetTester tester) async {
          final expected = TopRatedTvSeriesLoading();

          when(mockTopRatedTvSeriesCubit.state).thenReturn(expected);
          when(mockTopRatedTvSeriesCubit.stream)
              .thenAnswer((_) => Stream.value(expected));

          final progressBarFinder = find.byType(CircularProgressIndicator);
          final centerFinder = find.byType(Center);

          await tester.pumpWidget(_makeTestableWidgetTopRated());

          expect(centerFinder, findsOneWidget);
          expect(progressBarFinder, findsOneWidget);
        });

    testWidgets('Page should display ListView when data is loaded',
            (WidgetTester tester) async {
          final expected = TopRatedTvSeriesHasData([testTVSeries, testTVSeries]);

          when(mockTopRatedTvSeriesCubit.state).thenReturn(expected);
          when(mockTopRatedTvSeriesCubit.stream)
              .thenAnswer((_) => Stream.value(expected));

          final listViewFinder = find.byType(ListView);

          await tester.pumpWidget(_makeTestableWidgetTopRated());

          expect(listViewFinder, findsOneWidget);
          expect(find.byType(TVSeriesList), findsOneWidget);
        });
  });
}
