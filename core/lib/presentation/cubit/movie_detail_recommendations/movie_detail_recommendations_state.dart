part of 'movie_detail_recommendations_cubit.dart';

abstract class MovieDetailRecommendationsState extends Equatable {
  const MovieDetailRecommendationsState();

  @override
  List<Object> get props => [];
}

class MovieDetailRecommendationsEmpty extends MovieDetailRecommendationsState {}

class MovieDetailRecommendationsLoading
    extends MovieDetailRecommendationsState {}

class MovieDetailRecommendationsError extends MovieDetailRecommendationsState {
  final String message;

  const MovieDetailRecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailRecommendationsHasData
    extends MovieDetailRecommendationsState {
  final List<Movie> recommendations;

  const MovieDetailRecommendationsHasData(this.recommendations);

  @override
  List<Object> get props => [recommendations];
}
