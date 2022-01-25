import 'package:core/domain/entities/genre.dart';
import 'package:tv_series/tv_series.dart';

// TV Series
final testTVSeries = TVSeries(
  backdropPath: '/oKt4J3TFjWirVwBqoHyIvv5IImd.jpg',
  genreIds: const [18],
  id: 85552,
  name: 'Euphoria',
  overview:
  'A group of high school students navigate love and friendships in a world of drugs, sex, trauma, and social media.',
  popularity: 5201.673,
  posterPath: '/jtnfNzqZwN4E32FGGxx1YZaBWWf.jpg',
  voteAverage: 8.4,
  voteCount: 5455,
  firstAirDate: '2019-06-16',
  originalLanguage: 'en',
  originalName: 'Euphoria',
  originCountry: const ['US'],
);

final testTVSeriesList = [testTVSeries];

const testTVSeriesDetail = TVSeriesDetail(
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

const testTVSeriesTable = TVSeriesTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTVSeriesMap = {
  'id': 1,
  'name': 'name',
  'overview': 'overview',
  'posterPath': 'posterPath',
};

final testWatchlistTVSeries = TVSeries.watchlist(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);