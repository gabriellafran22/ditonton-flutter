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
export 'utils/ssl_pinning.dart';

// data
// data -> data sources
export 'data/datasources/db/database_helper.dart';
export 'data/datasources/movie_local_data_source.dart';
export 'data/datasources/movie_remote_data_source.dart';
// data -> repositories
export 'data/repositories/movie_repository_impl.dart';
// data -> models
export 'data/models/movie_table.dart';
export 'data/models/movie_detail_model.dart';
export 'data/models/movie_model.dart';
export 'data/models/movie_response.dart';
export 'data/models/genre_model.dart';

// domain
// domain -> entities
export 'domain/entities/genre.dart';
export 'domain/entities/movie.dart';
export 'domain/entities/movie_detail.dart';
// domain -> usecases
export 'domain/usecases/get_movie_detail.dart';
export 'domain/usecases/get_movie_recommendations.dart';
export 'domain/usecases/get_now_playing_movies.dart';
export 'domain/usecases/get_popular_movies.dart';
export 'domain/usecases/get_top_rated_movies.dart';
export 'domain/usecases/get_watchlist_movies.dart';
export 'domain/usecases/get_watchlist_status.dart';
export 'domain/usecases/remove_watchlist.dart';
export 'domain/usecases/save_watchlist.dart';
export 'domain/repositories/movie_repository.dart';

// presentation
// presentation -> pages
export 'presentation/pages/movie_detail_page.dart';
export 'presentation/pages/home_movie_page.dart';
export 'presentation/pages/popular_movies_page.dart';
export 'presentation/pages/top_rated_movies_page.dart';
export 'presentation/pages/watchlist_movies_page.dart';
// presentation -> widgets
export 'presentation/widgets/movie_card_list.dart';
// presentation -> cubit
export 'presentation/cubit/get_watchlist_movies/get_watchlist_movies_cubit.dart';
// presentation -> cubit (movies)
export 'presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart';
export 'presentation/cubit/popular_movies/popular_movies_cubit.dart';
export 'presentation/cubit/top_rated_movies//top_rated_movies_cubit.dart';
export 'presentation/cubit/movie_detail/movie_detail_cubit.dart';
export 'presentation/cubit/movie_detail_recommendations/movie_detail_recommendations_cubit.dart';
export 'presentation/cubit/movie_watchlist/movie_watchlist_cubit.dart';
