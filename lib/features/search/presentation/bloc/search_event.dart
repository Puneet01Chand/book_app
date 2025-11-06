import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';
@freezed
abstract class SearchEvent with _$SearchEvent {
  const factory SearchEvent.started(String query) = SearchStarted;
  const factory SearchEvent.refresh() = SearchRefresh;
  const factory SearchEvent.clear() = SearchClear;
  const factory SearchEvent.updateFilters({
    String? query,
    String? category,
    String? sortBy,
  }) = SearchUpdateFilters;
}