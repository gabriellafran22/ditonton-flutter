import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search/presentation/bloc/utils.dart';
import 'package:search/search.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

part 'search_tv_series_event.dart';

part 'search_tv_series_state.dart';

class SearchTvSeriesBloc
    extends Bloc<SearchTvSeriesEvent, SearchTVSeriesState> {
  final SearchTVSeries _searchTVSeries;

  SearchTvSeriesBloc(this._searchTVSeries) : super(SearchTVSeriesEmpty()) {
    on<OnQueryChangedTVSeries>((event, emit) async {
      final query = event.query;

      emit(SearchTVSeriesLoading());
      final result = await _searchTVSeries.execute(query);

      result.fold(
        (failure) {
          emit(SearchTVSeriesError(failure.message));
        },
        (data) {
          emit(SearchTVSeriesHasData(data));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}
