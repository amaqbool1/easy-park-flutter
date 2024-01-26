// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingCollection on Isar {
  IsarCollection<Parking> get parkings => this.collection();
}

const ParkingSchema = CollectionSchema(
  name: r'Parking',
  id: 5203737299116830006,
  properties: {
    r'endHour': PropertySchema(
      id: 0,
      name: r'endHour',
      type: IsarType.dateTime,
    ),
    r'parkingAddress': PropertySchema(
      id: 1,
      name: r'parkingAddress',
      type: IsarType.string,
    ),
    r'parkingDate': PropertySchema(
      id: 2,
      name: r'parkingDate',
      type: IsarType.dateTime,
    ),
    r'parkingName': PropertySchema(
      id: 3,
      name: r'parkingName',
      type: IsarType.string,
    ),
    r'parkingSpotID': PropertySchema(
      id: 4,
      name: r'parkingSpotID',
      type: IsarType.long,
    ),
    r'parkingSpotNumber': PropertySchema(
      id: 5,
      name: r'parkingSpotNumber',
      type: IsarType.string,
    ),
    r'parkingSpotStatus': PropertySchema(
      id: 6,
      name: r'parkingSpotStatus',
      type: IsarType.byte,
      enumMap: _ParkingparkingSpotStatusEnumValueMap,
    ),
    r'startHour': PropertySchema(
      id: 7,
      name: r'startHour',
      type: IsarType.dateTime,
    ),
    r'totalAmount': PropertySchema(
      id: 8,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'totalHours': PropertySchema(
      id: 9,
      name: r'totalHours',
      type: IsarType.long,
    ),
    r'vehicleName': PropertySchema(
      id: 10,
      name: r'vehicleName',
      type: IsarType.string,
    ),
    r'vehicleNumber': PropertySchema(
      id: 11,
      name: r'vehicleNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingEstimateSize,
  serialize: _parkingSerialize,
  deserialize: _parkingDeserialize,
  deserializeProp: _parkingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _parkingGetId,
  getLinks: _parkingGetLinks,
  attach: _parkingAttach,
  version: '3.1.0+1',
);

int _parkingEstimateSize(
  Parking object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.parkingAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.parkingName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.parkingSpotNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vehicleName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.vehicleNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _parkingSerialize(
  Parking object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endHour);
  writer.writeString(offsets[1], object.parkingAddress);
  writer.writeDateTime(offsets[2], object.parkingDate);
  writer.writeString(offsets[3], object.parkingName);
  writer.writeLong(offsets[4], object.parkingSpotID);
  writer.writeString(offsets[5], object.parkingSpotNumber);
  writer.writeByte(offsets[6], object.parkingSpotStatus.index);
  writer.writeDateTime(offsets[7], object.startHour);
  writer.writeDouble(offsets[8], object.totalAmount);
  writer.writeLong(offsets[9], object.totalHours);
  writer.writeString(offsets[10], object.vehicleName);
  writer.writeString(offsets[11], object.vehicleNumber);
}

Parking _parkingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Parking();
  object.endHour = reader.readDateTimeOrNull(offsets[0]);
  object.id = id;
  object.parkingAddress = reader.readStringOrNull(offsets[1]);
  object.parkingDate = reader.readDateTimeOrNull(offsets[2]);
  object.parkingName = reader.readStringOrNull(offsets[3]);
  object.parkingSpotID = reader.readLongOrNull(offsets[4]);
  object.parkingSpotNumber = reader.readStringOrNull(offsets[5]);
  object.parkingSpotStatus = _ParkingparkingSpotStatusValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      ParkingSpotStatus.ACTIVE;
  object.startHour = reader.readDateTimeOrNull(offsets[7]);
  object.totalAmount = reader.readDoubleOrNull(offsets[8]);
  object.totalHours = reader.readLongOrNull(offsets[9]);
  object.vehicleName = reader.readStringOrNull(offsets[10]);
  object.vehicleNumber = reader.readStringOrNull(offsets[11]);
  return object;
}

P _parkingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (_ParkingparkingSpotStatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ParkingSpotStatus.ACTIVE) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ParkingparkingSpotStatusEnumValueMap = {
  'ACTIVE': 0,
  'COMPLETED': 1,
  'CANCELLED': 2,
};
const _ParkingparkingSpotStatusValueEnumMap = {
  0: ParkingSpotStatus.ACTIVE,
  1: ParkingSpotStatus.COMPLETED,
  2: ParkingSpotStatus.CANCELLED,
};

Id _parkingGetId(Parking object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _parkingGetLinks(Parking object) {
  return [];
}

void _parkingAttach(IsarCollection<dynamic> col, Id id, Parking object) {
  object.id = id;
}

extension ParkingQueryWhereSort on QueryBuilder<Parking, Parking, QWhere> {
  QueryBuilder<Parking, Parking, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingQueryWhere on QueryBuilder<Parking, Parking, QWhereClause> {
  QueryBuilder<Parking, Parking, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Parking, Parking, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Parking, Parking, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Parking, Parking, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ParkingQueryFilter
    on QueryBuilder<Parking, Parking, QFilterCondition> {
  QueryBuilder<Parking, Parking, QAfterFilterCondition> endHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endHour',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> endHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endHour',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> endHourEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> endHourGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> endHourLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> endHourBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parkingAddress',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parkingAddress',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parkingAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parkingAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parkingAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingAddressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parkingAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parkingAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parkingDate',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parkingDate',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parkingName',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parkingName',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parkingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parkingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parkingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parkingName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingName',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parkingName',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingSpotIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parkingSpotID',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parkingSpotID',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingSpotIDEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSpotID',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotIDGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingSpotID',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingSpotIDLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingSpotID',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> parkingSpotIDBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingSpotID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parkingSpotNumber',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parkingSpotNumber',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingSpotNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parkingSpotNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSpotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parkingSpotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotStatusEqualTo(ParkingSpotStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSpotStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotStatusGreaterThan(
    ParkingSpotStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parkingSpotStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotStatusLessThan(
    ParkingSpotStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parkingSpotStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      parkingSpotStatusBetween(
    ParkingSpotStatus lower,
    ParkingSpotStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parkingSpotStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> startHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startHour',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> startHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startHour',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> startHourEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> startHourGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> startHourLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> startHourBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalHoursIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalHours',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalHoursIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalHours',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalHoursEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalHoursGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalHoursLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalHours',
        value: value,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> totalHoursBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalHours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleName',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleName',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      vehicleNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleName',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'vehicleNumber',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      vehicleNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'vehicleNumber',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      vehicleNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vehicleNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vehicleNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vehicleNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'vehicleNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'vehicleNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'vehicleNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'vehicleNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition> vehicleNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vehicleNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Parking, Parking, QAfterFilterCondition>
      vehicleNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'vehicleNumber',
        value: '',
      ));
    });
  }
}

extension ParkingQueryObject
    on QueryBuilder<Parking, Parking, QFilterCondition> {}

extension ParkingQueryLinks
    on QueryBuilder<Parking, Parking, QFilterCondition> {}

extension ParkingQuerySortBy on QueryBuilder<Parking, Parking, QSortBy> {
  QueryBuilder<Parking, Parking, QAfterSortBy> sortByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAddress', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAddress', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingDate', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingDate', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingName', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingName', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingSpotID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotID', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingSpotIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotID', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingSpotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingSpotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingSpotStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotStatus', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByParkingSpotStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotStatus', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByTotalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByTotalHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByVehicleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleName', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByVehicleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleName', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByVehicleNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleNumber', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> sortByVehicleNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleNumber', Sort.desc);
    });
  }
}

extension ParkingQuerySortThenBy
    on QueryBuilder<Parking, Parking, QSortThenBy> {
  QueryBuilder<Parking, Parking, QAfterSortBy> thenByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAddress', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingAddress', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingDate', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingDate', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingName', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingName', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingSpotID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotID', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingSpotIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotID', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingSpotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingSpotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingSpotStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotStatus', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByParkingSpotStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotStatus', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByTotalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByTotalHoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalHours', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByVehicleName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleName', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByVehicleNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleName', Sort.desc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByVehicleNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleNumber', Sort.asc);
    });
  }

  QueryBuilder<Parking, Parking, QAfterSortBy> thenByVehicleNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vehicleNumber', Sort.desc);
    });
  }
}

extension ParkingQueryWhereDistinct
    on QueryBuilder<Parking, Parking, QDistinct> {
  QueryBuilder<Parking, Parking, QDistinct> distinctByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endHour');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByParkingAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByParkingDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingDate');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByParkingName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByParkingSpotID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSpotID');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByParkingSpotNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSpotNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByParkingSpotStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSpotStatus');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startHour');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByTotalHours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalHours');
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByVehicleName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parking, Parking, QDistinct> distinctByVehicleNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vehicleNumber',
          caseSensitive: caseSensitive);
    });
  }
}

extension ParkingQueryProperty
    on QueryBuilder<Parking, Parking, QQueryProperty> {
  QueryBuilder<Parking, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Parking, DateTime?, QQueryOperations> endHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endHour');
    });
  }

  QueryBuilder<Parking, String?, QQueryOperations> parkingAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingAddress');
    });
  }

  QueryBuilder<Parking, DateTime?, QQueryOperations> parkingDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingDate');
    });
  }

  QueryBuilder<Parking, String?, QQueryOperations> parkingNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingName');
    });
  }

  QueryBuilder<Parking, int?, QQueryOperations> parkingSpotIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSpotID');
    });
  }

  QueryBuilder<Parking, String?, QQueryOperations> parkingSpotNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSpotNumber');
    });
  }

  QueryBuilder<Parking, ParkingSpotStatus, QQueryOperations>
      parkingSpotStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSpotStatus');
    });
  }

  QueryBuilder<Parking, DateTime?, QQueryOperations> startHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startHour');
    });
  }

  QueryBuilder<Parking, double?, QQueryOperations> totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<Parking, int?, QQueryOperations> totalHoursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalHours');
    });
  }

  QueryBuilder<Parking, String?, QQueryOperations> vehicleNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleName');
    });
  }

  QueryBuilder<Parking, String?, QQueryOperations> vehicleNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vehicleNumber');
    });
  }
}
