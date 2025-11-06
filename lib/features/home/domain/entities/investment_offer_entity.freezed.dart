// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_offer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InvestmentOfferEntity _$InvestmentOfferEntityFromJson(
  Map<String, dynamic> json,
) {
  return _InvestmentOfferEntity.fromJson(json);
}

/// @nodoc
mixin _$InvestmentOfferEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get offerType => throw _privateConstructorUsedError;
  String get iconAsset => throw _privateConstructorUsedError;
  String? get discountText => throw _privateConstructorUsedError;

  /// Serializes this InvestmentOfferEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentOfferEntityCopyWith<InvestmentOfferEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentOfferEntityCopyWith<$Res> {
  factory $InvestmentOfferEntityCopyWith(
    InvestmentOfferEntity value,
    $Res Function(InvestmentOfferEntity) then,
  ) = _$InvestmentOfferEntityCopyWithImpl<$Res, InvestmentOfferEntity>;
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
class _$InvestmentOfferEntityCopyWithImpl<
  $Res,
  $Val extends InvestmentOfferEntity
>
    implements $InvestmentOfferEntityCopyWith<$Res> {
  _$InvestmentOfferEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentOfferEntity
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
abstract class _$$InvestmentOfferEntityImplCopyWith<$Res>
    implements $InvestmentOfferEntityCopyWith<$Res> {
  factory _$$InvestmentOfferEntityImplCopyWith(
    _$InvestmentOfferEntityImpl value,
    $Res Function(_$InvestmentOfferEntityImpl) then,
  ) = __$$InvestmentOfferEntityImplCopyWithImpl<$Res>;
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
class __$$InvestmentOfferEntityImplCopyWithImpl<$Res>
    extends
        _$InvestmentOfferEntityCopyWithImpl<$Res, _$InvestmentOfferEntityImpl>
    implements _$$InvestmentOfferEntityImplCopyWith<$Res> {
  __$$InvestmentOfferEntityImplCopyWithImpl(
    _$InvestmentOfferEntityImpl _value,
    $Res Function(_$InvestmentOfferEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentOfferEntity
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
      _$InvestmentOfferEntityImpl(
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
class _$InvestmentOfferEntityImpl implements _InvestmentOfferEntity {
  const _$InvestmentOfferEntityImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.offerType,
    required this.iconAsset,
    this.discountText,
  });

  factory _$InvestmentOfferEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentOfferEntityImplFromJson(json);

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
    return 'InvestmentOfferEntity(id: $id, title: $title, description: $description, imageUrl: $imageUrl, offerType: $offerType, iconAsset: $iconAsset, discountText: $discountText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentOfferEntityImpl &&
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

  /// Create a copy of InvestmentOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentOfferEntityImplCopyWith<_$InvestmentOfferEntityImpl>
  get copyWith =>
      __$$InvestmentOfferEntityImplCopyWithImpl<_$InvestmentOfferEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentOfferEntityImplToJson(this);
  }
}

abstract class _InvestmentOfferEntity implements InvestmentOfferEntity {
  const factory _InvestmentOfferEntity({
    required final String id,
    required final String title,
    required final String description,
    required final String imageUrl,
    required final String offerType,
    required final String iconAsset,
    final String? discountText,
  }) = _$InvestmentOfferEntityImpl;

  factory _InvestmentOfferEntity.fromJson(Map<String, dynamic> json) =
      _$InvestmentOfferEntityImpl.fromJson;

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

  /// Create a copy of InvestmentOfferEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentOfferEntityImplCopyWith<_$InvestmentOfferEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
