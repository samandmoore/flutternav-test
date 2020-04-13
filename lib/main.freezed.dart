// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PersonalInfoFlowStepTearOff {
  const _$PersonalInfoFlowStepTearOff();

  _Name name(String name) {
    return _Name(
      name,
    );
  }

  _Age age(int age) {
    return _Age(
      age,
    );
  }

  _Weight weight(double weight) {
    return _Weight(
      weight,
    );
  }
}

// ignore: unused_element
const $PersonalInfoFlowStep = _$PersonalInfoFlowStepTearOff();

mixin _$PersonalInfoFlowStep {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result name(String name),
    @required Result age(int age),
    @required Result weight(double weight),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result name(String name),
    Result age(int age),
    Result weight(double weight),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result name(_Name value),
    @required Result age(_Age value),
    @required Result weight(_Weight value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result name(_Name value),
    Result age(_Age value),
    Result weight(_Weight value),
    @required Result orElse(),
  });
}

abstract class $PersonalInfoFlowStepCopyWith<$Res> {
  factory $PersonalInfoFlowStepCopyWith(PersonalInfoFlowStep value,
          $Res Function(PersonalInfoFlowStep) then) =
      _$PersonalInfoFlowStepCopyWithImpl<$Res>;
}

class _$PersonalInfoFlowStepCopyWithImpl<$Res>
    implements $PersonalInfoFlowStepCopyWith<$Res> {
  _$PersonalInfoFlowStepCopyWithImpl(this._value, this._then);

  final PersonalInfoFlowStep _value;
  // ignore: unused_field
  final $Res Function(PersonalInfoFlowStep) _then;
}

abstract class _$NameCopyWith<$Res> {
  factory _$NameCopyWith(_Name value, $Res Function(_Name) then) =
      __$NameCopyWithImpl<$Res>;
  $Res call({String name});
}

class __$NameCopyWithImpl<$Res> extends _$PersonalInfoFlowStepCopyWithImpl<$Res>
    implements _$NameCopyWith<$Res> {
  __$NameCopyWithImpl(_Name _value, $Res Function(_Name) _then)
      : super(_value, (v) => _then(v as _Name));

  @override
  _Name get _value => super._value as _Name;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_Name(
      name == freezed ? _value.name : name as String,
    ));
  }
}

class _$_Name with DiagnosticableTreeMixin implements _Name {
  const _$_Name(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalInfoFlowStep.name(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalInfoFlowStep.name'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Name &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  _$NameCopyWith<_Name> get copyWith =>
      __$NameCopyWithImpl<_Name>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result name(String name),
    @required Result age(int age),
    @required Result weight(double weight),
  }) {
    assert(name != null);
    assert(age != null);
    assert(weight != null);
    return name(this.name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result name(String name),
    Result age(int age),
    Result weight(double weight),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (name != null) {
      return name(this.name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result name(_Name value),
    @required Result age(_Age value),
    @required Result weight(_Weight value),
  }) {
    assert(name != null);
    assert(age != null);
    assert(weight != null);
    return name(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result name(_Name value),
    Result age(_Age value),
    Result weight(_Weight value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (name != null) {
      return name(this);
    }
    return orElse();
  }
}

abstract class _Name implements PersonalInfoFlowStep {
  const factory _Name(String name) = _$_Name;

  String get name;
  _$NameCopyWith<_Name> get copyWith;
}

abstract class _$AgeCopyWith<$Res> {
  factory _$AgeCopyWith(_Age value, $Res Function(_Age) then) =
      __$AgeCopyWithImpl<$Res>;
  $Res call({int age});
}

class __$AgeCopyWithImpl<$Res> extends _$PersonalInfoFlowStepCopyWithImpl<$Res>
    implements _$AgeCopyWith<$Res> {
  __$AgeCopyWithImpl(_Age _value, $Res Function(_Age) _then)
      : super(_value, (v) => _then(v as _Age));

  @override
  _Age get _value => super._value as _Age;

  @override
  $Res call({
    Object age = freezed,
  }) {
    return _then(_Age(
      age == freezed ? _value.age : age as int,
    ));
  }
}

class _$_Age with DiagnosticableTreeMixin implements _Age {
  const _$_Age(this.age) : assert(age != null);

  @override
  final int age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalInfoFlowStep.age(age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalInfoFlowStep.age'))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Age &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(age);

  @override
  _$AgeCopyWith<_Age> get copyWith =>
      __$AgeCopyWithImpl<_Age>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result name(String name),
    @required Result age(int age),
    @required Result weight(double weight),
  }) {
    assert(name != null);
    assert(age != null);
    assert(weight != null);
    return age(this.age);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result name(String name),
    Result age(int age),
    Result weight(double weight),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (age != null) {
      return age(this.age);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result name(_Name value),
    @required Result age(_Age value),
    @required Result weight(_Weight value),
  }) {
    assert(name != null);
    assert(age != null);
    assert(weight != null);
    return age(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result name(_Name value),
    Result age(_Age value),
    Result weight(_Weight value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (age != null) {
      return age(this);
    }
    return orElse();
  }
}

abstract class _Age implements PersonalInfoFlowStep {
  const factory _Age(int age) = _$_Age;

  int get age;
  _$AgeCopyWith<_Age> get copyWith;
}

abstract class _$WeightCopyWith<$Res> {
  factory _$WeightCopyWith(_Weight value, $Res Function(_Weight) then) =
      __$WeightCopyWithImpl<$Res>;
  $Res call({double weight});
}

class __$WeightCopyWithImpl<$Res>
    extends _$PersonalInfoFlowStepCopyWithImpl<$Res>
    implements _$WeightCopyWith<$Res> {
  __$WeightCopyWithImpl(_Weight _value, $Res Function(_Weight) _then)
      : super(_value, (v) => _then(v as _Weight));

  @override
  _Weight get _value => super._value as _Weight;

  @override
  $Res call({
    Object weight = freezed,
  }) {
    return _then(_Weight(
      weight == freezed ? _value.weight : weight as double,
    ));
  }
}

class _$_Weight with DiagnosticableTreeMixin implements _Weight {
  const _$_Weight(this.weight) : assert(weight != null);

  @override
  final double weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalInfoFlowStep.weight(weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalInfoFlowStep.weight'))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Weight &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weight);

  @override
  _$WeightCopyWith<_Weight> get copyWith =>
      __$WeightCopyWithImpl<_Weight>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result name(String name),
    @required Result age(int age),
    @required Result weight(double weight),
  }) {
    assert(name != null);
    assert(age != null);
    assert(weight != null);
    return weight(this.weight);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result name(String name),
    Result age(int age),
    Result weight(double weight),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weight != null) {
      return weight(this.weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result name(_Name value),
    @required Result age(_Age value),
    @required Result weight(_Weight value),
  }) {
    assert(name != null);
    assert(age != null);
    assert(weight != null);
    return weight(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result name(_Name value),
    Result age(_Age value),
    Result weight(_Weight value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (weight != null) {
      return weight(this);
    }
    return orElse();
  }
}

abstract class _Weight implements PersonalInfoFlowStep {
  const factory _Weight(double weight) = _$_Weight;

  double get weight;
  _$WeightCopyWith<_Weight> get copyWith;
}

class _$PersonalInfoFlowDataTearOff {
  const _$PersonalInfoFlowDataTearOff();

  _State call({String name, int age, double weight}) {
    return _State(
      name: name,
      age: age,
      weight: weight,
    );
  }
}

// ignore: unused_element
const $PersonalInfoFlowData = _$PersonalInfoFlowDataTearOff();

mixin _$PersonalInfoFlowData {
  String get name;
  int get age;
  double get weight;

  $PersonalInfoFlowDataCopyWith<PersonalInfoFlowData> get copyWith;
}

abstract class $PersonalInfoFlowDataCopyWith<$Res> {
  factory $PersonalInfoFlowDataCopyWith(PersonalInfoFlowData value,
          $Res Function(PersonalInfoFlowData) then) =
      _$PersonalInfoFlowDataCopyWithImpl<$Res>;
  $Res call({String name, int age, double weight});
}

class _$PersonalInfoFlowDataCopyWithImpl<$Res>
    implements $PersonalInfoFlowDataCopyWith<$Res> {
  _$PersonalInfoFlowDataCopyWithImpl(this._value, this._then);

  final PersonalInfoFlowData _value;
  // ignore: unused_field
  final $Res Function(PersonalInfoFlowData) _then;

  @override
  $Res call({
    Object name = freezed,
    Object age = freezed,
    Object weight = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      age: age == freezed ? _value.age : age as int,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }
}

abstract class _$StateCopyWith<$Res>
    implements $PersonalInfoFlowDataCopyWith<$Res> {
  factory _$StateCopyWith(_State value, $Res Function(_State) then) =
      __$StateCopyWithImpl<$Res>;
  @override
  $Res call({String name, int age, double weight});
}

class __$StateCopyWithImpl<$Res>
    extends _$PersonalInfoFlowDataCopyWithImpl<$Res>
    implements _$StateCopyWith<$Res> {
  __$StateCopyWithImpl(_State _value, $Res Function(_State) _then)
      : super(_value, (v) => _then(v as _State));

  @override
  _State get _value => super._value as _State;

  @override
  $Res call({
    Object name = freezed,
    Object age = freezed,
    Object weight = freezed,
  }) {
    return _then(_State(
      name: name == freezed ? _value.name : name as String,
      age: age == freezed ? _value.age : age as int,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }
}

class _$_State with DiagnosticableTreeMixin implements _State {
  const _$_State({this.name, this.age, this.weight});

  @override
  final String name;
  @override
  final int age;
  @override
  final double weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalInfoFlowData(name: $name, age: $age, weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalInfoFlowData'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _State &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(weight);

  @override
  _$StateCopyWith<_State> get copyWith =>
      __$StateCopyWithImpl<_State>(this, _$identity);
}

abstract class _State implements PersonalInfoFlowData {
  const factory _State({String name, int age, double weight}) = _$_State;

  @override
  String get name;
  @override
  int get age;
  @override
  double get weight;
  @override
  _$StateCopyWith<_State> get copyWith;
}

class _$PersonalInfoTearOff {
  const _$PersonalInfoTearOff();

  _PersonalInfo call(String name, int age, double weight) {
    return _PersonalInfo(
      name,
      age,
      weight,
    );
  }
}

// ignore: unused_element
const $PersonalInfo = _$PersonalInfoTearOff();

mixin _$PersonalInfo {
  String get name;
  int get age;
  double get weight;

  $PersonalInfoCopyWith<PersonalInfo> get copyWith;
}

abstract class $PersonalInfoCopyWith<$Res> {
  factory $PersonalInfoCopyWith(
          PersonalInfo value, $Res Function(PersonalInfo) then) =
      _$PersonalInfoCopyWithImpl<$Res>;
  $Res call({String name, int age, double weight});
}

class _$PersonalInfoCopyWithImpl<$Res> implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._value, this._then);

  final PersonalInfo _value;
  // ignore: unused_field
  final $Res Function(PersonalInfo) _then;

  @override
  $Res call({
    Object name = freezed,
    Object age = freezed,
    Object weight = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      age: age == freezed ? _value.age : age as int,
      weight: weight == freezed ? _value.weight : weight as double,
    ));
  }
}

abstract class _$PersonalInfoCopyWith<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  factory _$PersonalInfoCopyWith(
          _PersonalInfo value, $Res Function(_PersonalInfo) then) =
      __$PersonalInfoCopyWithImpl<$Res>;
  @override
  $Res call({String name, int age, double weight});
}

class __$PersonalInfoCopyWithImpl<$Res> extends _$PersonalInfoCopyWithImpl<$Res>
    implements _$PersonalInfoCopyWith<$Res> {
  __$PersonalInfoCopyWithImpl(
      _PersonalInfo _value, $Res Function(_PersonalInfo) _then)
      : super(_value, (v) => _then(v as _PersonalInfo));

  @override
  _PersonalInfo get _value => super._value as _PersonalInfo;

  @override
  $Res call({
    Object name = freezed,
    Object age = freezed,
    Object weight = freezed,
  }) {
    return _then(_PersonalInfo(
      name == freezed ? _value.name : name as String,
      age == freezed ? _value.age : age as int,
      weight == freezed ? _value.weight : weight as double,
    ));
  }
}

class _$_PersonalInfo with DiagnosticableTreeMixin implements _PersonalInfo {
  const _$_PersonalInfo(this.name, this.age, this.weight)
      : assert(name != null),
        assert(age != null),
        assert(weight != null);

  @override
  final String name;
  @override
  final int age;
  @override
  final double weight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonalInfo(name: $name, age: $age, weight: $weight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonalInfo'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('weight', weight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PersonalInfo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.weight, weight) ||
                const DeepCollectionEquality().equals(other.weight, weight)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(weight);

  @override
  _$PersonalInfoCopyWith<_PersonalInfo> get copyWith =>
      __$PersonalInfoCopyWithImpl<_PersonalInfo>(this, _$identity);
}

abstract class _PersonalInfo implements PersonalInfo {
  const factory _PersonalInfo(String name, int age, double weight) =
      _$_PersonalInfo;

  @override
  String get name;
  @override
  int get age;
  @override
  double get weight;
  @override
  _$PersonalInfoCopyWith<_PersonalInfo> get copyWith;
}
