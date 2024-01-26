// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spot.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParkingSpotCollection on Isar {
  IsarCollection<ParkingSpot> get parkingSpots => this.collection();
}

const ParkingSpotSchema = CollectionSchema(
  name: r'ParkingSpot',
  id: -5161271992813122822,
  properties: {
    r'alreadyBooked': PropertySchema(
      id: 0,
      name: r'alreadyBooked',
      type: IsarType.bool,
    ),
    r'isSelected': PropertySchema(
      id: 1,
      name: r'isSelected',
      type: IsarType.bool,
    ),
    r'parkingSpotNumber': PropertySchema(
      id: 2,
      name: r'parkingSpotNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _parkingSpotEstimateSize,
  serialize: _parkingSpotSerialize,
  deserialize: _parkingSpotDeserialize,
  deserializeProp: _parkingSpotDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _parkingSpotGetId,
  getLinks: _parkingSpotGetLinks,
  attach: _parkingSpotAttach,
  version: '3.1.0+1',
);

int _parkingSpotEstimateSize(
  ParkingSpot object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.parkingSpotNumber.length * 3;
  return bytesCount;
}

void _parkingSpotSerialize(
  ParkingSpot object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.alreadyBooked);
  writer.writeBool(offsets[1], object.isSelected);
  writer.writeString(offsets[2], object.parkingSpotNumber);
}

ParkingSpot _parkingSpotDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ParkingSpot();
  object.alreadyBooked = reader.readBool(offsets[0]);
  object.id = id;
  object.isSelected = reader.readBool(offsets[1]);
  object.parkingSpotNumber = reader.readString(offsets[2]);
  return object;
}

P _parkingSpotDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parkingSpotGetId(ParkingSpot object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _parkingSpotGetLinks(ParkingSpot object) {
  return [];
}

void _parkingSpotAttach(
    IsarCollection<dynamic> col, Id id, ParkingSpot object) {
  object.id = id;
}

extension ParkingSpotQueryWhereSort
    on QueryBuilder<ParkingSpot, ParkingSpot, QWhere> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParkingSpotQueryWhere
    on QueryBuilder<ParkingSpot, ParkingSpot, QWhereClause> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterWhereClause> idBetween(
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

extension ParkingSpotQueryFilter
    on QueryBuilder<ParkingSpot, ParkingSpot, QFilterCondition> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      alreadyBookedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alreadyBooked',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      isSelectedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelected',
        value: value,
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberEqualTo(
    String value, {
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberGreaterThan(
    String value, {
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberLessThan(
    String value, {
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
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

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parkingSpotNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parkingSpotNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parkingSpotNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterFilterCondition>
      parkingSpotNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parkingSpotNumber',
        value: '',
      ));
    });
  }
}

extension ParkingSpotQueryObject
    on QueryBuilder<ParkingSpot, ParkingSpot, QFilterCondition> {}

extension ParkingSpotQueryLinks
    on QueryBuilder<ParkingSpot, ParkingSpot, QFilterCondition> {}

extension ParkingSpotQuerySortBy
    on QueryBuilder<ParkingSpot, ParkingSpot, QSortBy> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByAlreadyBooked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyBooked', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      sortByAlreadyBookedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyBooked', Sort.desc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> sortByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      sortByParkingSpotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      sortByParkingSpotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.desc);
    });
  }
}

extension ParkingSpotQuerySortThenBy
    on QueryBuilder<ParkingSpot, ParkingSpot, QSortThenBy> {
  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByAlreadyBooked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyBooked', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      thenByAlreadyBookedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyBooked', Sort.desc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy> thenByIsSelectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelected', Sort.desc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      thenByParkingSpotNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.asc);
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QAfterSortBy>
      thenByParkingSpotNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parkingSpotNumber', Sort.desc);
    });
  }
}

extension ParkingSpotQueryWhereDistinct
    on QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> {
  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByAlreadyBooked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alreadyBooked');
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByIsSelected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSelected');
    });
  }

  QueryBuilder<ParkingSpot, ParkingSpot, QDistinct> distinctByParkingSpotNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parkingSpotNumber',
          caseSensitive: caseSensitive);
    });
  }
}

extension ParkingSpotQueryProperty
    on QueryBuilder<ParkingSpot, ParkingSpot, QQueryProperty> {
  QueryBuilder<ParkingSpot, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ParkingSpot, bool, QQueryOperations> alreadyBookedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alreadyBooked');
    });
  }

  QueryBuilder<ParkingSpot, bool, QQueryOperations> isSelectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSelected');
    });
  }

  QueryBuilder<ParkingSpot, String, QQueryOperations>
      parkingSpotNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parkingSpotNumber');
    });
  }
}
