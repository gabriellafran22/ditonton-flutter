library tv_series;

// data
// data -> data sources
export 'data/datasources/tv_series_local_data_source.dart';
export 'data/datasources/tv_series_remote_data_source.dart';
// data -> repositories
export 'data/repositories/tv_series_repository_impl.dart';
// data -> models
export 'data/models/tv_series_table.dart';
export 'data/models/tv_series_detail_model.dart';
export 'data/models/tv_series_model.dart';
export 'data/models/tv_series_response.dart';

// domain
// domain -> entities
export 'domain/entities/tv_series.dart';
export 'domain/entities/tv_series_detail.dart';
// domain -> usecases
export 'domain/usecases/get_now_playing_tv_series.dart';
export 'domain/usecases/get_popular_tv_series.dart';
export 'domain/usecases/get_top_rated_tv_series.dart';
export 'domain/usecases/get_tv_series_detail.dart';
export 'domain/usecases/get_tv_series_recommendations.dart';
export 'domain/usecases/get_watchlist_status_tv_series.dart';
export 'domain/usecases/get_watchlist_tv_series.dart';
export 'domain/usecases/remove_watchlist_tv_series.dart';
export 'domain/usecases/save_watchlist_tv_series.dart';
export 'domain/repositories/tv_series_repository.dart';

// presentation
// presentation -> pages
export 'presentation/pages/popular_tv_series_page.dart';
export 'presentation/pages/top_rated_tv_series_page.dart';
export 'presentation/pages/tv_series_detail_page.dart';
export 'presentation/pages/tv_series_page.dart';
// presentation -> widgets
export 'presentation/widgets/tv_series_card.dart';
// presentation -> cubit
export 'presentation/cubit/get_watchlist_tv_series/get_watchlist_tv_series_cubit.dart';
// presentation -> cubit (tv series)
export 'presentation/cubit/now_playing_tv_series/now_playing_tv_series_cubit.dart';
export 'presentation/cubit/popular_tv_series/popular_tv_series_cubit.dart';
export 'presentation/cubit/top_rated_tv_series/top_rated_tv_series_cubit.dart';
export 'presentation/cubit/tv_series_detail/tv_series_detail_cubit.dart';
export 'presentation/cubit/tv_series_detail_recommendations/tv_series_detail_recommendations_cubit.dart';
export 'presentation/cubit/tv_series_watchlist/tv_series_watchlist_cubit.dart';
