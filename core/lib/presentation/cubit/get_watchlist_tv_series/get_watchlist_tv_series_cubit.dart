import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'get_watchlist_tv_series_state.dart';

class GetWatchlistTvSeriesCubit extends Cubit<GetWatchlistTvSeriesState> {
  final GetWatchlistTVSeries _getWatchlistTvSeries;

  GetWatchlistTvSeriesCubit(this._getWatchlistTvSeries) : super(GetWatchlistTvSeriesEmpty());

  Future<void> getWatchlistTvSeries() async {
    emit(GetWatchlistTvSeriesLoading());
    final result = await _getWatchlistTvSeries.execute();

    result.fold(
          (failure) {
        emit(GetWatchlistTvSeriesError(failure.message));
      },
          (moviesData) {
        emit(GetWatchlistTvSeriesHasData(moviesData));
      },
    );
  }
}
