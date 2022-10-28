// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movie_response_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TopRatedMovieResponseModel> _$topRatedMovieResponseModelSerializer =
    new _$TopRatedMovieResponseModelSerializer();

class _$TopRatedMovieResponseModelSerializer
    implements StructuredSerializer<TopRatedMovieResponseModel> {
  @override
  final Iterable<Type> types = const [
    TopRatedMovieResponseModel,
    _$TopRatedMovieResponseModel
  ];
  @override
  final String wireName = 'TopRatedMovieResponseModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TopRatedMovieResponseModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ResultModel)])),
    ];
    Object? value;
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPages;
    if (value != null) {
      result
        ..add('total_pages')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalResults;
    if (value != null) {
      result
        ..add('total_results')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  TopRatedMovieResponseModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TopRatedMovieResponseModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'page':
          result.page = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ResultModel)]))!
              as BuiltList<Object?>);
          break;
        case 'total_results':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$TopRatedMovieResponseModel extends TopRatedMovieResponseModel {
  @override
  final int? page;
  @override
  final int? totalPages;
  @override
  final BuiltList<ResultModel> results;
  @override
  final int? totalResults;

  factory _$TopRatedMovieResponseModel(
          [void Function(TopRatedMovieResponseModelBuilder)? updates]) =>
      (new TopRatedMovieResponseModelBuilder()..update(updates))._build();

  _$TopRatedMovieResponseModel._(
      {this.page, this.totalPages, required this.results, this.totalResults})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        results, r'TopRatedMovieResponseModel', 'results');
  }

  @override
  TopRatedMovieResponseModel rebuild(
          void Function(TopRatedMovieResponseModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TopRatedMovieResponseModelBuilder toBuilder() =>
      new TopRatedMovieResponseModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TopRatedMovieResponseModel &&
        page == other.page &&
        totalPages == other.totalPages &&
        results == other.results &&
        totalResults == other.totalResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, page.hashCode), totalPages.hashCode), results.hashCode),
        totalResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TopRatedMovieResponseModel')
          ..add('page', page)
          ..add('totalPages', totalPages)
          ..add('results', results)
          ..add('totalResults', totalResults))
        .toString();
  }
}

class TopRatedMovieResponseModelBuilder
    implements
        Builder<TopRatedMovieResponseModel, TopRatedMovieResponseModelBuilder> {
  _$TopRatedMovieResponseModel? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  ListBuilder<ResultModel>? _results;
  ListBuilder<ResultModel> get results =>
      _$this._results ??= new ListBuilder<ResultModel>();
  set results(ListBuilder<ResultModel>? results) => _$this._results = results;

  int? _totalResults;
  int? get totalResults => _$this._totalResults;
  set totalResults(int? totalResults) => _$this._totalResults = totalResults;

  TopRatedMovieResponseModelBuilder();

  TopRatedMovieResponseModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _totalPages = $v.totalPages;
      _results = $v.results.toBuilder();
      _totalResults = $v.totalResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TopRatedMovieResponseModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TopRatedMovieResponseModel;
  }

  @override
  void update(void Function(TopRatedMovieResponseModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TopRatedMovieResponseModel build() => _build();

  _$TopRatedMovieResponseModel _build() {
    _$TopRatedMovieResponseModel _$result;
    try {
      _$result = _$v ??
          new _$TopRatedMovieResponseModel._(
              page: page,
              totalPages: totalPages,
              results: results.build(),
              totalResults: totalResults);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TopRatedMovieResponseModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
