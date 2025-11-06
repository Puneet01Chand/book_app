// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchStarted value)?  started,TResult Function( SearchRefresh value)?  refresh,TResult Function( SearchClear value)?  clear,TResult Function( SearchUpdateFilters value)?  updateFilters,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchStarted() when started != null:
return started(_that);case SearchRefresh() when refresh != null:
return refresh(_that);case SearchClear() when clear != null:
return clear(_that);case SearchUpdateFilters() when updateFilters != null:
return updateFilters(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchStarted value)  started,required TResult Function( SearchRefresh value)  refresh,required TResult Function( SearchClear value)  clear,required TResult Function( SearchUpdateFilters value)  updateFilters,}){
final _that = this;
switch (_that) {
case SearchStarted():
return started(_that);case SearchRefresh():
return refresh(_that);case SearchClear():
return clear(_that);case SearchUpdateFilters():
return updateFilters(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchStarted value)?  started,TResult? Function( SearchRefresh value)?  refresh,TResult? Function( SearchClear value)?  clear,TResult? Function( SearchUpdateFilters value)?  updateFilters,}){
final _that = this;
switch (_that) {
case SearchStarted() when started != null:
return started(_that);case SearchRefresh() when refresh != null:
return refresh(_that);case SearchClear() when clear != null:
return clear(_that);case SearchUpdateFilters() when updateFilters != null:
return updateFilters(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  started,TResult Function()?  refresh,TResult Function()?  clear,TResult Function( String? query,  String? category,  String? sortBy)?  updateFilters,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchStarted() when started != null:
return started(_that.query);case SearchRefresh() when refresh != null:
return refresh();case SearchClear() when clear != null:
return clear();case SearchUpdateFilters() when updateFilters != null:
return updateFilters(_that.query,_that.category,_that.sortBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  started,required TResult Function()  refresh,required TResult Function()  clear,required TResult Function( String? query,  String? category,  String? sortBy)  updateFilters,}) {final _that = this;
switch (_that) {
case SearchStarted():
return started(_that.query);case SearchRefresh():
return refresh();case SearchClear():
return clear();case SearchUpdateFilters():
return updateFilters(_that.query,_that.category,_that.sortBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  started,TResult? Function()?  refresh,TResult? Function()?  clear,TResult? Function( String? query,  String? category,  String? sortBy)?  updateFilters,}) {final _that = this;
switch (_that) {
case SearchStarted() when started != null:
return started(_that.query);case SearchRefresh() when refresh != null:
return refresh();case SearchClear() when clear != null:
return clear();case SearchUpdateFilters() when updateFilters != null:
return updateFilters(_that.query,_that.category,_that.sortBy);case _:
  return null;

}
}

}

/// @nodoc


class SearchStarted implements SearchEvent {
  const SearchStarted(this.query);
  

 final  String query;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStartedCopyWith<SearchStarted> get copyWith => _$SearchStartedCopyWithImpl<SearchStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchStarted&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchEvent.started(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchStartedCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchStartedCopyWith(SearchStarted value, $Res Function(SearchStarted) _then) = _$SearchStartedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchStartedCopyWithImpl<$Res>
    implements $SearchStartedCopyWith<$Res> {
  _$SearchStartedCopyWithImpl(this._self, this._then);

  final SearchStarted _self;
  final $Res Function(SearchStarted) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchStarted(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchRefresh implements SearchEvent {
  const SearchRefresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRefresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.refresh()';
}


}




/// @nodoc


class SearchClear implements SearchEvent {
  const SearchClear();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchClear);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.clear()';
}


}




/// @nodoc


class SearchUpdateFilters implements SearchEvent {
  const SearchUpdateFilters({this.query, this.category, this.sortBy});
  

 final  String? query;
 final  String? category;
 final  String? sortBy;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUpdateFiltersCopyWith<SearchUpdateFilters> get copyWith => _$SearchUpdateFiltersCopyWithImpl<SearchUpdateFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUpdateFilters&&(identical(other.query, query) || other.query == query)&&(identical(other.category, category) || other.category == category)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy));
}


@override
int get hashCode => Object.hash(runtimeType,query,category,sortBy);

@override
String toString() {
  return 'SearchEvent.updateFilters(query: $query, category: $category, sortBy: $sortBy)';
}


}

/// @nodoc
abstract mixin class $SearchUpdateFiltersCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory $SearchUpdateFiltersCopyWith(SearchUpdateFilters value, $Res Function(SearchUpdateFilters) _then) = _$SearchUpdateFiltersCopyWithImpl;
@useResult
$Res call({
 String? query, String? category, String? sortBy
});




}
/// @nodoc
class _$SearchUpdateFiltersCopyWithImpl<$Res>
    implements $SearchUpdateFiltersCopyWith<$Res> {
  _$SearchUpdateFiltersCopyWithImpl(this._self, this._then);

  final SearchUpdateFilters _self;
  final $Res Function(SearchUpdateFilters) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? category = freezed,Object? sortBy = freezed,}) {
  return _then(SearchUpdateFilters(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
