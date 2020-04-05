// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DummyFlowEventTearOff {
  const _$DummyFlowEventTearOff();

  _StepOne stepOne(String name) {
    return _StepOne(
      name,
    );
  }

  _StepTwo stepTwo(int age) {
    return _StepTwo(
      age,
    );
  }

  _StepThree stepThree(double weight) {
    return _StepThree(
      weight,
    );
  }
}

// ignore: unused_element
const $DummyFlowEvent = _$DummyFlowEventTearOff();

mixin _$DummyFlowEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result stepOne(String name),
    @required Result stepTwo(int age),
    @required Result stepThree(double weight),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result stepOne(String name),
    Result stepTwo(int age),
    Result stepThree(double weight),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result stepOne(_StepOne value),
    @required Result stepTwo(_StepTwo value),
    @required Result stepThree(_StepThree value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result stepOne(_StepOne value),
    Result stepTwo(_StepTwo value),
    Result stepThree(_StepThree value),
    @required Result orElse(),
  });
}

abstract class $DummyFlowEventCopyWith<$Res> {
  factory $DummyFlowEventCopyWith(
          DummyFlowEvent value, $Res Function(DummyFlowEvent) then) =
      _$DummyFlowEventCopyWithImpl<$Res>;
}

class _$DummyFlowEventCopyWithImpl<$Res>
    implements $DummyFlowEventCopyWith<$Res> {
  _$DummyFlowEventCopyWithImpl(this._value, this._then);

  final DummyFlowEvent _value;
  // ignore: unused_field
  final $Res Function(DummyFlowEvent) _then;
}

abstract class _$StepOneCopyWith<$Res> {
  factory _$StepOneCopyWith(_StepOne value, $Res Function(_StepOne) then) =
      __$StepOneCopyWithImpl<$Res>;
  $Res call({String name});
}

class __$StepOneCopyWithImpl<$Res> extends _$DummyFlowEventCopyWithImpl<$Res>
    implements _$StepOneCopyWith<$Res> {
  __$StepOneCopyWithImpl(_StepOne _value, $Res Function(_StepOne) _then)
      : super(_value, (v) => _then(v as _StepOne));

  @override
  _StepOne get _value => super._value as _StepOne;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_StepOne(
      name == freezed ? _value.name : name as String,
    ));
  }
}

class _$_StepOne with DiagnosticableTreeMixin implements _StepOne {
  const _$_StepOne(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DummyFlowEvent.stepOne(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DummyFlowEvent.stepOne'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StepOne &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  _$StepOneCopyWith<_StepOne> get copyWith =>
      __$StepOneCopyWithImpl<_StepOne>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result stepOne(String name),
    @required Result stepTwo(int age),
    @required Result stepThree(double weight),
  }) {
    assert(stepOne != null);
    assert(stepTwo != null);
    assert(stepThree != null);
    return stepOne(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result stepOne(String name),
    Result stepTwo(int age),
    Result stepThree(double weight),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stepOne != null) {
      return stepOne(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result stepOne(_StepOne value),
    @required Result stepTwo(_StepTwo value),
    @required Result stepThree(_StepThree value),
  }) {
    assert(stepOne != null);
    assert(stepTwo != null);
    assert(stepThree != null);
    return stepOne(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result stepOne(_StepOne value),
    Result stepTwo(_StepTwo value),
    Result stepThree(_StepThree value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stepOne != null) {
      return stepOne(this);
    }
    return orElse();
  }
}

abstract class _StepOne implements DummyFlowEvent {
  const factory _StepOne(String name) = _$_StepOne;

  String get name;
  _$StepOneCopyWith<_StepOne> get copyWith;
}

abstract class _$StepTwoCopyWith<$Res> {
  factory _$StepTwoCopyWith(_StepTwo value, $Res Function(_StepTwo) then) =
      __$StepTwoCopyWithImpl<$Res>;
  $Res call({int age});
}

class __$StepTwoCopyWithImpl<$Res> extends _$DummyFlowEventCopyWithImpl<$Res>
    implements _$StepTwoCopyWith<$Res> {
  __$StepTwoCopyWithImpl(_StepTwo _value, $Res Function(_StepTwo) _then)
      : super(_value, (v) => _then(v as _StepTwo));

  @override
  _StepTwo get _value => super._value as _StepTwo;

  @override
  $Res call({
    Object age = freezed,
  }) {
    return _then(_StepTwo(
      age == freezed ? _value.age : age as int,
    ));
  }
}

class _$_StepTwo with DiagnosticableTreeMixin implements _StepTwo {
  const _$_StepTwo(this.age) : assert(age != null);

  @override
  final int age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DummyFlowEvent.stepTwo(age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DummyFlowEvent.stepTwo'))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StepTwo &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(age);

  @override
  _$StepTwoCopyWith<_StepTwo> get copyWith =>
      __$StepTwoCopyWithImpl<_StepTwo>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result stepOne(String name),
    @required Result stepTwo(int age),
    @required Result stepThree(double weight),
  }) {
    assert(stepOne != null);
    assert(stepTwo != null);
    assert(stepThree != null);
    return stepTwo(age);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result stepOne(String name),
    Result stepTwo(int age),
    Result stepThree(double weight),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stepTwo != null) {
      return stepTwo(age);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result stepOne(_StepOne value),
    @required Result stepTwo(_StepTwo value),
    @required Result stepThree(_StepThree value),
  }) {
    assert(stepOne != null);
    assert(stepTwo != null);
    assert(stepThree != null);
    return stepTwo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result stepOne(_StepOne value),
    Result stepTwo(_StepTwo value),
    Result stepThree(_StepThree value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stepTwo != null) {
      return stepTwo(this);
    }
    return orElse();
  }
}

abstract class _StepTwo implements DummyFlowEvent {
  const factory _StepTwo(int age) = _$_StepTwo;

  int get age;
  _$StepTwoCopyWith<_StepTwo> get copyWith;
}

abstract class _$StepThreeCopyWith<$Res> {
  factory _$StepThreeCopyWith(
          _StepThree value, $Res Function(_StepThree) then) =
      __$StepThreeCopyWithImpl<$Res>;
  $Res call({double weight});
}

class __$StepThreeCopyWithImpl<$Res> extends _$DummyFlowEventCopyWithImpl<$Res>
    implements _$StepThreeCopyWith<$Res> {
  __$StepThreeCopyWithImpl(_StepThree _value, $Res Function(_StepThree) _then)
      : super(_value, (v) => _then(v as _StepThree));

  @override
  _StepThree get _value => super._value as _StepThree;

  @override
  $Res call({
    Object weight = freezed,
  }) {
    return _then(_StepThree(
      weight == freezed ? _value.weight : weight as double,
    ));
  }
}

class _$_StepThree with DiagnosticableTreeMixin implements _StepThree {
  const _$_StepThree(this.weight) : assert(weight != null);

  @override
  final double weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DummyFlowEvent.stepThree(weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DummyFlowEvent.stepThree'))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StepThree &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weight);

  @override
  _$StepThreeCopyWith<_StepThree> get copyWith =>
      __$StepThreeCopyWithImpl<_StepThree>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result stepOne(String name),
    @required Result stepTwo(int age),
    @required Result stepThree(double weight),
  }) {
    assert(stepOne != null);
    assert(stepTwo != null);
    assert(stepThree != null);
    return stepThree(weight);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result stepOne(String name),
    Result stepTwo(int age),
    Result stepThree(double weight),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stepThree != null) {
      return stepThree(weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result stepOne(_StepOne value),
    @required Result stepTwo(_StepTwo value),
    @required Result stepThree(_StepThree value),
  }) {
    assert(stepOne != null);
    assert(stepTwo != null);
    assert(stepThree != null);
    return stepThree(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result stepOne(_StepOne value),
    Result stepTwo(_StepTwo value),
    Result stepThree(_StepThree value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stepThree != null) {
      return stepThree(this);
    }
    return orElse();
  }
}

abstract class _StepThree implements DummyFlowEvent {
  const factory _StepThree(double weight) = _$_StepThree;

  double get weight;
  _$StepThreeCopyWith<_StepThree> get copyWith;
}
