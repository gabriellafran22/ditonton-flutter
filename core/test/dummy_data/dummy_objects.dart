import 'package:core/data/models/movie_table.dart';
import 'package:core/data/models/tv_series_table.dart';
import 'package:core/domain/entities/genre.dart';
import 'package:core/domain/entities/movie.dart';
import 'package:core/domain/entities/movie_detail.dart';
import 'package:core/domain/entities/tv_series.dart';
import 'package:core/domain/entities/tv_series_detail.dart';

// Movies
final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
  'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

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