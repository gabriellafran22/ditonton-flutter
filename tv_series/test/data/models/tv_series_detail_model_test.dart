import 'package:core/data/models/genre_model.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/data/models/tv_series_detail_model.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';

void main() {
  const tTVSeriesDetailModel = TVSeriesDetailResponse(
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

  const tTVSeriesDetail = TVSeriesDetail(
    adult: false,
    backdropPath: 'backdropPath',
    genres: [Genre(id: 18, name: 'Drama')],
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

  test('should be a subclass of TV Series Detail entity', () async {
    final result = tTVSeriesDetailModel.toEntity();
    expect(result, tTVSeriesDetail);
  });
}
