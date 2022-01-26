import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'popular_tv_series_page_test.mocks.dart';

@GenerateMocks([PopularTvSeriesCubit])
void main() {
  late MockPopularTvSeriesCubit mockPopularTvSeriesCubit;

  setUp(() {
    mockPopularTvSeriesCubit = MockPopularTvSeriesCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<PopularTvSeriesCubit>.value(
      value: mockPopularTvSeriesCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
          (WidgetTester tester) async {
        final expected = PopularTvSeriesLoading();

        when(mockPopularTvSeriesCubit.state).thenReturn(expected);
        when(mockPopularTvSeriesCubit.stream).thenAnswer((_) => Stream.value(expected));

        final progressBarFinder = find.byType(CircularProgressIndicator);
        final centerFinder = find.byType(Center);

        await tester.pumpWidget(_makeTestableWidget(const PopularTVSeriesPage()));

        expect(centerFinder, findsOneWidget);
        expect(progressBarFinder, findsOneWidget);
      });

  testWidgets('Page should display ListView when data is loaded',
          (WidgetTester tester) async {
        final expected = PopularTvSeriesHasData(<TVSeries>[testTVSeries]);

        when(mockPopularTvSeriesCubit.state).thenReturn(expected);
        when(mockPopularTvSeriesCubit.stream).thenAnswer((_) => Stream.value(expected));

        final listViewFinder = find.byType(ListView);

        await tester.pumpWidget(_makeTestableWidget(const PopularTVSeriesPage()));

        expect(listViewFinder, findsOneWidget);
        expect(find.byType(TVSeriesCard), findsOneWidget);
      });
}