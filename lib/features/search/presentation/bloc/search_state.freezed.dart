// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchInitialState value)?  initial,TResult Function( SearchLoadingState value)?  loading,TResult Function( SearchSuccessState value)?  success,TResult Function( SearchEmptyState value)?  empty,TResult Function( SearchErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchInitialState() when initial != null:
return initial(_that);case SearchLoadingState() when loading != null:
return loading(_that);case SearchSuccessState() when success != null:
return success(_that);case SearchEmptyState() when empty != null:
return empty(_that);case SearchErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchInitialState value)  initial,required TResult Function( SearchLoadingState value)  loading,required TResult Function( SearchSuccessState value)  success,required TResult Function( SearchEmptyState value)  empty,required TResult Function( SearchErrorState value)  error,}){
final _that = this;
switch (_that) {
case SearchInitialState():
return initial(_that);case SearchLoadingState():
return loading(_that);case SearchSuccessState():
return success(_that);case SearchEmptyState():
return empty(_that);case SearchErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchInitialState value)?  initial,TResult? Function( SearchLoadingState value)?  loading,TResult? Function( SearchSuccessState value)?  success,TResult? Function( SearchEmptyState value)?  empty,TResult? Function( SearchErrorState value)?  error,}){
final _that = this;
switch (_that) {
case SearchInitialState() when initial != null:
return initial(_that);case SearchLoadingState() when loading != null:
return loading(_that);case SearchSuccessState() when success != null:
return success(_that);case SearchEmptyState() when empty != null:
return empty(_that);case SearchErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<BookEntity> books,  int totalItems,  String query)?  success,TResult Function( String query)?  empty,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchInitialState() when initial != null:
return initial();case SearchLoadingState() when loading != null:
return loading();case SearchSuccessState() when success != null:
return success(_that.books,_that.totalItems,_that.query);case SearchEmptyState() when empty != null:
return empty(_that.query);case SearchErrorState() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<BookEntity> books,  int totalItems,  String query)  success,required TResult Function( String query)  empty,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SearchInitialState():
return initial();case SearchLoadingState():
return loading();case SearchSuccessState():
return success(_that.books,_that.totalItems,_that.query);case SearchEmptyState():
return empty(_that.query);case SearchErrorState():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<BookEntity> books,  int totalItems,  String query)?  success,TResult? Function( String query)?  empty,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SearchInitialState() when initial != null:
return initial();case SearchLoadingState() when loading != null:
return loading();case SearchSuccessState() when success != null:
return success(_that.books,_that.totalItems,_that.query);case SearchEmptyState() when empty != null:
return empty(_that.query);case SearchErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SearchInitialState implements SearchState {
  const SearchInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class SearchLoadingState implements SearchState {
  const SearchLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class SearchSuccessState implements SearchState {
  const SearchSuccessState({required final  List<BookEntity> books, required this.totalItems, required this.query}): _books = books;
  

 final  List<BookEntity> _books;
 List<BookEntity> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}

 final  int totalItems;
 final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchSuccessStateCopyWith<SearchSuccessState> get copyWith => _$SearchSuccessStateCopyWithImpl<SearchSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchSuccessState&&const DeepCollectionEquality().equals(other._books, _books)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_books),totalItems,query);

@override
String toString() {
  return 'SearchState.success(books: $books, totalItems: $totalItems, query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchSuccessStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchSuccessStateCopyWith(SearchSuccessState value, $Res Function(SearchSuccessState) _then) = _$SearchSuccessStateCopyWithImpl;
@useResult
$Res call({
 List<BookEntity> books, int totalItems, String query
});




}
/// @nodoc
class _$SearchSuccessStateCopyWithImpl<$Res>
    implements $SearchSuccessStateCopyWith<$Res> {
  _$SearchSuccessStateCopyWithImpl(this._self, this._then);

  final SearchSuccessState _self;
  final $Res Function(SearchSuccessState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? books = null,Object? totalItems = null,Object? query = null,}) {
  return _then(SearchSuccessState(
books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<BookEntity>,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchEmptyState implements SearchState {
  const SearchEmptyState(this.query);
  

 final  String query;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEmptyStateCopyWith<SearchEmptyState> get copyWith => _$SearchEmptyStateCopyWithImpl<SearchEmptyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEmptyState&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'SearchState.empty(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchEmptyStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchEmptyStateCopyWith(SearchEmptyState value, $Res Function(SearchEmptyState) _then) = _$SearchEmptyStateCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchEmptyStateCopyWithImpl<$Res>
    implements $SearchEmptyStateCopyWith<$Res> {
  _$SearchEmptyStateCopyWithImpl(this._self, this._then);

  final SearchEmptyState _self;
  final $Res Function(SearchEmptyState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchEmptyState(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchErrorState implements SearchState {
  const SearchErrorState(this.message);
  

 final  String message;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchErrorStateCopyWith<SearchErrorState> get copyWith => _$SearchErrorStateCopyWithImpl<SearchErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SearchState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchErrorStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory $SearchErrorStateCopyWith(SearchErrorState value, $Res Function(SearchErrorState) _then) = _$SearchErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SearchErrorStateCopyWithImpl<$Res>
    implements $SearchErrorStateCopyWith<$Res> {
  _$SearchErrorStateCopyWithImpl(this._self, this._then);

  final SearchErrorState _self;
  final $Res Function(SearchErrorState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SearchErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
