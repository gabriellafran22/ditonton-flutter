import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv_series.dart';

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
