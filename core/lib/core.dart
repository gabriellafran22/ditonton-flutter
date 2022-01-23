library core;

// Style
export 'styles/colors.dart';
export 'styles/text_styles.dart';

// utils
export 'utils/constants.dart';
export 'utils/exception.dart';
export 'utils/failure.dart';
export 'utils/state_enum.dart';
export 'utils/utils.dart';
export 'utils/routes.dart';

// data
// data -> data sources
export 'data/datasources/db/database_helper.dart';
export 'data/datasources/movie_local_data_source.dart';
export 'data/datasources/movie_remote_data_source.dart';
export 'data/datasources/tv_series_local_data_source.dart';
export 'data/datasources/tv_series_remote_data_source.dart';
// data -> repositories
export 'data/repositories/movie_repository_impl.dart';
export 'data/repositories/tv_series_repository_impl.dart';
// data -> models
export 'data/models/movie_table.dart';
export 'data/models/movie_detail_model.dart';
export 'data/models/movie_model.dart';
export 'data/models/movie_response.dart';
export 'data/models/tv_series_table.dart';
export 'data/models/tv_series_detail_model.dart';
export 'data/models/tv_series_model.dart';
export 'data/models/tv_series_response.dart';
export 'data/models/genre_model.dart';

// domain
// domain -> entities
export 'domain/entities/genre.dart';
export 'domain/entities/movie.dart';
export 'domain/entities/movie_detail.dart';
export 'domain/entities/tv_series.dart';
export 'domain/entities/tv_series_detail.dart';
// domain -> usecases
export 'domain/usecases/get_movie_detail.dart';
export 'domain/usecases/get_movie_recommendations.dart';
export 'domain/usecases/get_now_playing_movies.dart';
export 'domain/usecases/get_now_playing_tv_series.dart';
export 'domain/usecases/get_popular_movies.dart';
export 'domain/usecases/get_popular_tv_series.dart';
export 'domain/usecases/get_top_rated_movies.dart';
export 'domain/usecases/get_top_rated_tv_series.dart';
export 'domain/usecases/get_tv_series_detail.dart';
export 'domain/usecases/get_tv_series_recommendations.dart';
export 'domain/usecases/get_watchlist_movies.dart';
export 'domain/usecases/get_watchlist_status.dart';
export 'domain/usecases/get_watchlist_status_tv_series.dart';
export 'domain/usecases/get_watchlist_tv_series.dart';
export 'domain/usecases/remove_watchlist.dart';
export 'domain/usecases/remove_watchlist_tv_series.dart';
export 'domain/usecases/save_watchlist.dart';
export 'domain/usecases/save_watchlist_tv_series.dart';
export 'domain/repositories/movie_repository.dart';
export 'domain/repositories/tv_series_repository.dart';

// presentation
// presentation -> provider
export 'presentation/provider/movie_detail_notifier.dart';
export 'presentation/provider/movie_list_notifier.dart';
export 'presentation/provider/popular_movies_notifier.dart';
export 'presentation/provider/popular_tv_series_notifier.dart';
export 'presentation/provider/top_rated_movies_notifier.dart';
export 'presentation/provider/top_rated_tv_series_notifier.dart';
export 'presentation/provider/tv_series_detail_notifier.dart';
export 'presentation/provider/tv_series_list_notifier.dart';
export 'presentation/provider/watchlist_movie_notifier.dart';
export 'presentation/provider/watchlist_tv_series_notifier.dart';
// presentation -> pages
export 'presentation/pages/movie_detail_page.dart';
export 'presentation/pages/home_movie_page.dart';
export 'presentation/pages/popular_movies_page.dart';
export 'presentation/pages/popular_tv_series_page.dart';
export 'presentation/pages/top_rated_movies_page.dart';
export 'presentation/pages/top_rated_tv_series_page.dart';
export 'presentation/pages/tv_series_detail_page.dart';
export 'presentation/pages/tv_series_page.dart';
export 'presentation/pages/watchlist_movies_page.dart';
// presentation -> widgets
export 'presentation/widgets/movie_card_list.dart';
export 'presentation/widgets/tv_series_card.dart';
// presentation -> cubit (movies)
export 'presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart';
export 'presentation/cubit/popular_movies/popular_movies_cubit.dart';
export 'presentation/cubit/top_rated_movies//top_rated_movies_cubit.dart';
export 'presentation/cubit/movie_detail/movie_detail_cubit.dart';
export 'presentation/cubit/movie_detail_recommendations/movie_detail_recommendations_cubit.dart';
export 'presentation/cubit/movie_watchlist/movie_watchlist_cubit.dart';
// presentation -> cubit (tv series)
export 'presentation/cubit/now_playing_tv_series/now_playing_tv_series_cubit.dart';
export 'presentation/cubit/popular_tv_series/popular_tv_series_cubit.dart';
export 'presentation/cubit/top_rated_tv_series/top_rated_tv_series_cubit.dart';
export 'presentation/cubit/tv_series_detail/tv_series_detail_cubit.dart';
export 'presentation/cubit/tv_series_detail_recommendations/tv_series_detail_recommendations_cubit.dart';
export 'presentation/cubit/tv_series_watchlist/tv_series_watchlist_cubit.dart';
