// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whats_new_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WhatsNewEntity _$WhatsNewEntityFromJson(Map<String, dynamic> json) {
  return _WhatsNewEntity.fromJson(json);
}

/// @nodoc
mixin _$WhatsNewEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'image_path')
  String get imagePath => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this WhatsNewEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WhatsNewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WhatsNewEntityCopyWith<WhatsNewEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhatsNewEntityCopyWith<$Res> {
  factory $WhatsNewEntityCopyWith(
    WhatsNewEntity value,
    $Res Function(WhatsNewEntity) then,
  ) = _$WhatsNewEntityCopyWithImpl<$Res, WhatsNewEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    @JsonKey(name: 'image_path') String imagePath,
    String type,
  });
}

/// @nodoc
class _$WhatsNewEntityCopyWithImpl<$Res, $Val extends WhatsNewEntity>
    implements $WhatsNewEntityCopyWith<$Res> {
  _$WhatsNewEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WhatsNewEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imagePath = null,
    Object? type = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            imagePath: null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WhatsNewEntityImplCopyWith<$Res>
    implements $WhatsNewEntityCopyWith<$Res> {
  factory _$$WhatsNewEntityImplCopyWith(
    _$WhatsNewEntityImpl value,
    $Res Function(_$WhatsNewEntityImpl) then,
  ) = __$$WhatsNewEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    @JsonKey(name: 'image_path') String imagePath,
    String type,
  });
}

/// @nodoc
class __$$WhatsNewEntityImplCopyWithImpl<$Res>
    extends _$WhatsNewEntityCopyWithImpl<$Res, _$WhatsNewEntityImpl>
    implements _$$WhatsNewEntityImplCopyWith<$Res> {
  __$$WhatsNewEntityImplCopyWithImpl(
    _$WhatsNewEntityImpl _value,
    $Res Function(_$WhatsNewEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WhatsNewEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imagePath = null,
    Object? type = null,
  }) {
    return _then(
      _$WhatsNewEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        imagePath: null == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WhatsNewEntityImpl implements _WhatsNewEntity {
  const _$WhatsNewEntityImpl({
    required this.id,
    required this.title,
    required this.description,
    @JsonKey(name: 'image_path') required this.imagePath,
    required this.type,
  });

  factory _$WhatsNewEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhatsNewEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_path')
  final String imagePath;
  @override
  final String type;

  @override
  String toString() {
    return 'WhatsNewEntity(id: $id, title: $title, description: $description, imagePath: $imagePath, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhatsNewEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, imagePath, type);

  /// Create a copy of WhatsNewEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WhatsNewEntityImplCopyWith<_$WhatsNewEntityImpl> get copyWith =>
      __$$WhatsNewEntityImplCopyWithImpl<_$WhatsNewEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WhatsNewEntityImplToJson(this);
  }
}

abstract class _WhatsNewEntity implements WhatsNewEntity {
  const factory _WhatsNewEntity({
    required final String id,
    required final String title,
    required final String description,
    @JsonKey(name: 'image_path') required final String imagePath,
    required final String type,
  }) = _$WhatsNewEntityImpl;

  factory _WhatsNewEntity.fromJson(Map<String, dynamic> json) =
      _$WhatsNewEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_path')
  String get imagePath;
  @override
  String get type;

  /// Create a copy of WhatsNewEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WhatsNewEntityImplCopyWith<_$WhatsNewEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
