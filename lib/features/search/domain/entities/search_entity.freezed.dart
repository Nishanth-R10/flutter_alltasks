// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) {
  return _SearchEntity.fromJson(json);
}

/// @nodoc
mixin _$SearchEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'image_path')
  String? get imagePath => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this SearchEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchEntityCopyWith<SearchEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEntityCopyWith<$Res> {
  factory $SearchEntityCopyWith(
    SearchEntity value,
    $Res Function(SearchEntity) then,
  ) = _$SearchEntityCopyWithImpl<$Res, SearchEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String type,
    @JsonKey(name: 'image_path') String? imagePath,
    String? description,
  });
}

/// @nodoc
class _$SearchEntityCopyWithImpl<$Res, $Val extends SearchEntity>
    implements $SearchEntityCopyWith<$Res> {
  _$SearchEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? imagePath = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            imagePath: freezed == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchEntityImplCopyWith<$Res>
    implements $SearchEntityCopyWith<$Res> {
  factory _$$SearchEntityImplCopyWith(
    _$SearchEntityImpl value,
    $Res Function(_$SearchEntityImpl) then,
  ) = __$$SearchEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String type,
    @JsonKey(name: 'image_path') String? imagePath,
    String? description,
  });
}

/// @nodoc
class __$$SearchEntityImplCopyWithImpl<$Res>
    extends _$SearchEntityCopyWithImpl<$Res, _$SearchEntityImpl>
    implements _$$SearchEntityImplCopyWith<$Res> {
  __$$SearchEntityImplCopyWithImpl(
    _$SearchEntityImpl _value,
    $Res Function(_$SearchEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? imagePath = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$SearchEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        imagePath: freezed == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchEntityImpl implements _SearchEntity {
  const _$SearchEntityImpl({
    required this.id,
    required this.title,
    required this.type,
    @JsonKey(name: 'image_path') this.imagePath,
    this.description,
  });

  factory _$SearchEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String type;
  // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @override
  final String? description;

  @override
  String toString() {
    return 'SearchEntity(id: $id, title: $title, type: $type, imagePath: $imagePath, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, type, imagePath, description);

  /// Create a copy of SearchEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEntityImplCopyWith<_$SearchEntityImpl> get copyWith =>
      __$$SearchEntityImplCopyWithImpl<_$SearchEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchEntityImplToJson(this);
  }
}

abstract class _SearchEntity implements SearchEntity {
  const factory _SearchEntity({
    required final String id,
    required final String title,
    required final String type,
    @JsonKey(name: 'image_path') final String? imagePath,
    final String? description,
  }) = _$SearchEntityImpl;

  factory _SearchEntity.fromJson(Map<String, dynamic> json) =
      _$SearchEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get type; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_path')
  String? get imagePath;
  @override
  String? get description;

  /// Create a copy of SearchEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchEntityImplCopyWith<_$SearchEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
