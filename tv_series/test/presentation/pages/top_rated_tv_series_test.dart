import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'top_rated_tv_series_test.mocks.dart';

@GenerateMocks([TopRatedTvSeriesCubit])
void main() {
  late MockTopRatedTvSeriesCubit mockTopRatedTvSeriesCubit;

  setUp(() {
    mockTopRatedTvSeriesCubit = MockTopRatedTvSeriesCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TopRatedTvSeriesCubit>.value(
      value: mockTopRatedTvSeriesCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    final expected = TopRatedTvSeriesLoading();

    when(mockTopRatedTvSeriesCubit.state).thenReturn(expected);
    when(mockTopRatedTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(expected));

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTVSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    final expected = TopRatedTvSeriesHasData(<TVSeries>[testTVSeries]);

    when(mockTopRatedTvSeriesCubit.state).thenReturn(expected);
    when(mockTopRatedTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(expected));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const TopRatedTVSeriesPage()));

    expect(listViewFinder, findsOneWidget);
    expect(find.byType(TVSeriesCard), findsOneWidget);
  });
}
