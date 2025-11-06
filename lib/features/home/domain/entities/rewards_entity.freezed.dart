// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RewardsEntity _$RewardsEntityFromJson(Map<String, dynamic> json) {
  return _RewardsEntity.fromJson(json);
}

/// @nodoc
mixin _$RewardsEntity {
  int get totalPoints => throw _privateConstructorUsedError;
  int get pointsEarned => throw _privateConstructorUsedError;
  double get progressPercentage => throw _privateConstructorUsedError;
  double get amountAway => throw _privateConstructorUsedError;
  double get nextRewardThreshold => throw _privateConstructorUsedError;

  /// Serializes this RewardsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RewardsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RewardsEntityCopyWith<RewardsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardsEntityCopyWith<$Res> {
  factory $RewardsEntityCopyWith(
    RewardsEntity value,
    $Res Function(RewardsEntity) then,
  ) = _$RewardsEntityCopyWithImpl<$Res, RewardsEntity>;
  @useResult
  $Res call({
    int totalPoints,
    int pointsEarned,
    double progressPercentage,
    double amountAway,
    double nextRewardThreshold,
  });
}

/// @nodoc
class _$RewardsEntityCopyWithImpl<$Res, $Val extends RewardsEntity>
    implements $RewardsEntityCopyWith<$Res> {
  _$RewardsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RewardsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? pointsEarned = null,
    Object? progressPercentage = null,
    Object? amountAway = null,
    Object? nextRewardThreshold = null,
  }) {
    return _then(
      _value.copyWith(
            totalPoints: null == totalPoints
                ? _value.totalPoints
                : totalPoints // ignore: cast_nullable_to_non_nullable
                      as int,
            pointsEarned: null == pointsEarned
                ? _value.pointsEarned
                : pointsEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            progressPercentage: null == progressPercentage
                ? _value.progressPercentage
                : progressPercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            amountAway: null == amountAway
                ? _value.amountAway
                : amountAway // ignore: cast_nullable_to_non_nullable
                      as double,
            nextRewardThreshold: null == nextRewardThreshold
                ? _value.nextRewardThreshold
                : nextRewardThreshold // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RewardsEntityImplCopyWith<$Res>
    implements $RewardsEntityCopyWith<$Res> {
  factory _$$RewardsEntityImplCopyWith(
    _$RewardsEntityImpl value,
    $Res Function(_$RewardsEntityImpl) then,
  ) = __$$RewardsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalPoints,
    int pointsEarned,
    double progressPercentage,
    double amountAway,
    double nextRewardThreshold,
  });
}

/// @nodoc
class __$$RewardsEntityImplCopyWithImpl<$Res>
    extends _$RewardsEntityCopyWithImpl<$Res, _$RewardsEntityImpl>
    implements _$$RewardsEntityImplCopyWith<$Res> {
  __$$RewardsEntityImplCopyWithImpl(
    _$RewardsEntityImpl _value,
    $Res Function(_$RewardsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RewardsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? pointsEarned = null,
    Object? progressPercentage = null,
    Object? amountAway = null,
    Object? nextRewardThreshold = null,
  }) {
    return _then(
      _$RewardsEntityImpl(
        totalPoints: null == totalPoints
            ? _value.totalPoints
            : totalPoints // ignore: cast_nullable_to_non_nullable
                  as int,
        pointsEarned: null == pointsEarned
            ? _value.pointsEarned
            : pointsEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        progressPercentage: null == progressPercentage
            ? _value.progressPercentage
            : progressPercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        amountAway: null == amountAway
            ? _value.amountAway
            : amountAway // ignore: cast_nullable_to_non_nullable
                  as double,
        nextRewardThreshold: null == nextRewardThreshold
            ? _value.nextRewardThreshold
            : nextRewardThreshold // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RewardsEntityImpl implements _RewardsEntity {
  const _$RewardsEntityImpl({
    required this.totalPoints,
    required this.pointsEarned,
    required this.progressPercentage,
    required this.amountAway,
    required this.nextRewardThreshold,
  });

  factory _$RewardsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RewardsEntityImplFromJson(json);

  @override
  final int totalPoints;
  @override
  final int pointsEarned;
  @override
  final double progressPercentage;
  @override
  final double amountAway;
  @override
  final double nextRewardThreshold;

  @override
  String toString() {
    return 'RewardsEntity(totalPoints: $totalPoints, pointsEarned: $pointsEarned, progressPercentage: $progressPercentage, amountAway: $amountAway, nextRewardThreshold: $nextRewardThreshold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RewardsEntityImpl &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.pointsEarned, pointsEarned) ||
                other.pointsEarned == pointsEarned) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.amountAway, amountAway) ||
                other.amountAway == amountAway) &&
            (identical(other.nextRewardThreshold, nextRewardThreshold) ||
                other.nextRewardThreshold == nextRewardThreshold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalPoints,
    pointsEarned,
    progressPercentage,
    amountAway,
    nextRewardThreshold,
  );

  /// Create a copy of RewardsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RewardsEntityImplCopyWith<_$RewardsEntityImpl> get copyWith =>
      __$$RewardsEntityImplCopyWithImpl<_$RewardsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RewardsEntityImplToJson(this);
  }
}

abstract class _RewardsEntity implements RewardsEntity {
  const factory _RewardsEntity({
    required final int totalPoints,
    required final int pointsEarned,
    required final double progressPercentage,
    required final double amountAway,
    required final double nextRewardThreshold,
  }) = _$RewardsEntityImpl;

  factory _RewardsEntity.fromJson(Map<String, dynamic> json) =
      _$RewardsEntityImpl.fromJson;

  @override
  int get totalPoints;
  @override
  int get pointsEarned;
  @override
  double get progressPercentage;
  @override
  double get amountAway;
  @override
  double get nextRewardThreshold;

  /// Create a copy of RewardsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RewardsEntityImplCopyWith<_$RewardsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
