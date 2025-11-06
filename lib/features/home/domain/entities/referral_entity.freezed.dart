// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReferralEntity _$ReferralEntityFromJson(Map<String, dynamic> json) {
  return _ReferralEntity.fromJson(json);
}

/// @nodoc
mixin _$ReferralEntity {
  String get referralCode => throw _privateConstructorUsedError;
  int get rewardPoints => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  int get friendsReferred => throw _privateConstructorUsedError;

  /// Serializes this ReferralEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferralEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferralEntityCopyWith<ReferralEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferralEntityCopyWith<$Res> {
  factory $ReferralEntityCopyWith(
    ReferralEntity value,
    $Res Function(ReferralEntity) then,
  ) = _$ReferralEntityCopyWithImpl<$Res, ReferralEntity>;
  @useResult
  $Res call({
    String referralCode,
    int rewardPoints,
    double totalEarnings,
    int friendsReferred,
  });
}

/// @nodoc
class _$ReferralEntityCopyWithImpl<$Res, $Val extends ReferralEntity>
    implements $ReferralEntityCopyWith<$Res> {
  _$ReferralEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferralEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
    Object? rewardPoints = null,
    Object? totalEarnings = null,
    Object? friendsReferred = null,
  }) {
    return _then(
      _value.copyWith(
            referralCode: null == referralCode
                ? _value.referralCode
                : referralCode // ignore: cast_nullable_to_non_nullable
                      as String,
            rewardPoints: null == rewardPoints
                ? _value.rewardPoints
                : rewardPoints // ignore: cast_nullable_to_non_nullable
                      as int,
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            friendsReferred: null == friendsReferred
                ? _value.friendsReferred
                : friendsReferred // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReferralEntityImplCopyWith<$Res>
    implements $ReferralEntityCopyWith<$Res> {
  factory _$$ReferralEntityImplCopyWith(
    _$ReferralEntityImpl value,
    $Res Function(_$ReferralEntityImpl) then,
  ) = __$$ReferralEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String referralCode,
    int rewardPoints,
    double totalEarnings,
    int friendsReferred,
  });
}

/// @nodoc
class __$$ReferralEntityImplCopyWithImpl<$Res>
    extends _$ReferralEntityCopyWithImpl<$Res, _$ReferralEntityImpl>
    implements _$$ReferralEntityImplCopyWith<$Res> {
  __$$ReferralEntityImplCopyWithImpl(
    _$ReferralEntityImpl _value,
    $Res Function(_$ReferralEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferralEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = null,
    Object? rewardPoints = null,
    Object? totalEarnings = null,
    Object? friendsReferred = null,
  }) {
    return _then(
      _$ReferralEntityImpl(
        referralCode: null == referralCode
            ? _value.referralCode
            : referralCode // ignore: cast_nullable_to_non_nullable
                  as String,
        rewardPoints: null == rewardPoints
            ? _value.rewardPoints
            : rewardPoints // ignore: cast_nullable_to_non_nullable
                  as int,
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        friendsReferred: null == friendsReferred
            ? _value.friendsReferred
            : friendsReferred // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferralEntityImpl implements _ReferralEntity {
  const _$ReferralEntityImpl({
    required this.referralCode,
    required this.rewardPoints,
    required this.totalEarnings,
    required this.friendsReferred,
  });

  factory _$ReferralEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferralEntityImplFromJson(json);

  @override
  final String referralCode;
  @override
  final int rewardPoints;
  @override
  final double totalEarnings;
  @override
  final int friendsReferred;

  @override
  String toString() {
    return 'ReferralEntity(referralCode: $referralCode, rewardPoints: $rewardPoints, totalEarnings: $totalEarnings, friendsReferred: $friendsReferred)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferralEntityImpl &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.friendsReferred, friendsReferred) ||
                other.friendsReferred == friendsReferred));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    referralCode,
    rewardPoints,
    totalEarnings,
    friendsReferred,
  );

  /// Create a copy of ReferralEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferralEntityImplCopyWith<_$ReferralEntityImpl> get copyWith =>
      __$$ReferralEntityImplCopyWithImpl<_$ReferralEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferralEntityImplToJson(this);
  }
}

abstract class _ReferralEntity implements ReferralEntity {
  const factory _ReferralEntity({
    required final String referralCode,
    required final int rewardPoints,
    required final double totalEarnings,
    required final int friendsReferred,
  }) = _$ReferralEntityImpl;

  factory _ReferralEntity.fromJson(Map<String, dynamic> json) =
      _$ReferralEntityImpl.fromJson;

  @override
  String get referralCode;
  @override
  int get rewardPoints;
  @override
  double get totalEarnings;
  @override
  int get friendsReferred;

  /// Create a copy of ReferralEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferralEntityImplCopyWith<_$ReferralEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
