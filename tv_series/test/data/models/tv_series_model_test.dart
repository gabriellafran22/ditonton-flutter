import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/tv_series_model.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

void main() {
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

  test('should be a subclass of TV Series entity', () async {
    final result = tTVSeriesModel.toEntity();
    expect(result, tTVSeries);
  });
}
