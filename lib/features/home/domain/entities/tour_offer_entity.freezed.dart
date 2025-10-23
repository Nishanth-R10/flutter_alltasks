// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_offer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TourOfferEntity _$TourOfferEntityFromJson(Map<String, dynamic> json) {
  return _TourOfferEntity.fromJson(json);
}

/// @nodoc
mixin _$TourOfferEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get offerType => throw _privateConstructorUsedError;
  String get iconAsset => throw _privateConstructorUsedError;
  String? get discountText => throw _privateConstructorUsedError;

  /// Serializes this TourOfferEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TourOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourOfferEntityCopyWith<TourOfferEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourOfferEntityCopyWith<$Res> {
  factory $TourOfferEntityCopyWith(
    TourOfferEntity value,
    $Res Function(TourOfferEntity) then,
  ) = _$TourOfferEntityCopyWithImpl<$Res, TourOfferEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String imageUrl,
    String offerType,
    String iconAsset,
    String? discountText,
  });
}

/// @nodoc
class _$TourOfferEntityCopyWithImpl<$Res, $Val extends TourOfferEntity>
    implements $TourOfferEntityCopyWith<$Res> {
  _$TourOfferEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TourOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? offerType = null,
    Object? iconAsset = null,
    Object? discountText = freezed,
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
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            offerType: null == offerType
                ? _value.offerType
                : offerType // ignore: cast_nullable_to_non_nullable
                      as String,
            iconAsset: null == iconAsset
                ? _value.iconAsset
                : iconAsset // ignore: cast_nullable_to_non_nullable
                      as String,
            discountText: freezed == discountText
                ? _value.discountText
                : discountText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TourOfferEntityImplCopyWith<$Res>
    implements $TourOfferEntityCopyWith<$Res> {
  factory _$$TourOfferEntityImplCopyWith(
    _$TourOfferEntityImpl value,
    $Res Function(_$TourOfferEntityImpl) then,
  ) = __$$TourOfferEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String imageUrl,
    String offerType,
    String iconAsset,
    String? discountText,
  });
}

/// @nodoc
class __$$TourOfferEntityImplCopyWithImpl<$Res>
    extends _$TourOfferEntityCopyWithImpl<$Res, _$TourOfferEntityImpl>
    implements _$$TourOfferEntityImplCopyWith<$Res> {
  __$$TourOfferEntityImplCopyWithImpl(
    _$TourOfferEntityImpl _value,
    $Res Function(_$TourOfferEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TourOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? offerType = null,
    Object? iconAsset = null,
    Object? discountText = freezed,
  }) {
    return _then(
      _$TourOfferEntityImpl(
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
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        offerType: null == offerType
            ? _value.offerType
            : offerType // ignore: cast_nullable_to_non_nullable
                  as String,
        iconAsset: null == iconAsset
            ? _value.iconAsset
            : iconAsset // ignore: cast_nullable_to_non_nullable
                  as String,
        discountText: freezed == discountText
            ? _value.discountText
            : discountText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TourOfferEntityImpl implements _TourOfferEntity {
  const _$TourOfferEntityImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.offerType,
    required this.iconAsset,
    this.discountText,
  });

  factory _$TourOfferEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourOfferEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final String offerType;
  @override
  final String iconAsset;
  @override
  final String? discountText;

  @override
  String toString() {
    return 'TourOfferEntity(id: $id, title: $title, description: $description, imageUrl: $imageUrl, offerType: $offerType, iconAsset: $iconAsset, discountText: $discountText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourOfferEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.offerType, offerType) ||
                other.offerType == offerType) &&
            (identical(other.iconAsset, iconAsset) ||
                other.iconAsset == iconAsset) &&
            (identical(other.discountText, discountText) ||
                other.discountText == discountText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    imageUrl,
    offerType,
    iconAsset,
    discountText,
  );

  /// Create a copy of TourOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourOfferEntityImplCopyWith<_$TourOfferEntityImpl> get copyWith =>
      __$$TourOfferEntityImplCopyWithImpl<_$TourOfferEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TourOfferEntityImplToJson(this);
  }
}

abstract class _TourOfferEntity implements TourOfferEntity {
  const factory _TourOfferEntity({
    required final String id,
    required final String title,
    required final String description,
    required final String imageUrl,
    required final String offerType,
    required final String iconAsset,
    final String? discountText,
  }) = _$TourOfferEntityImpl;

  factory _TourOfferEntity.fromJson(Map<String, dynamic> json) =
      _$TourOfferEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get offerType;
  @override
  String get iconAsset;
  @override
  String? get discountText;

  /// Create a copy of TourOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourOfferEntityImplCopyWith<_$TourOfferEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
