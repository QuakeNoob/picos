/*   This file is part of Picos, a health tracking mobile app
*    Copyright (C) 2022 Healthcare IT Solutions GmbH
*
*    This program is free software: you can redistribute it and/or modify
*    it under the terms of the GNU General Public License as published by
*    the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU General Public License for more details.
*
*    You should have received a copy of the GNU General Public License
*    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:picos/models/abstract_database_object.dart';

/// Class with PHQ4 answers.
class PHQ4 extends AbstractDatabaseObject {
  /// Creates a PHQ4 object.
  PHQ4({
    required this.date,
    this.a,
    this.b,
    this.c,
    this.d,
    String? objectId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(objectId: objectId, createdAt: createdAt, updatedAt: updatedAt) {
    hasNullValues = _checkHasNullValues();
    hasAnyValue = _checkHasAnyValue();
  }

  /// The database table the objects are stored in.
  static const String databaseTable = 'PICOS_PHQ4';

  /// Answer to question a.
  final int? a;

  /// Answer to question b.
  final int? b;

  /// Answer to question c.
  final int? c;

  /// Answer to question d.
  final int? d;

  /// The assessment date.
  final DateTime date;

  /// The information if this objects has any null values.
  late final bool hasNullValues;

  /// The information if this objects has any non-null value.
  late final bool hasAnyValue;

  @override
  get table {
    return databaseTable;
  }

  @override
  PHQ4 copyWith({
    DateTime? date,
    int? a,
    int? b,
    int? c,
    int? d,
    String? objectId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PHQ4(
      date: date ?? this.date,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      objectId: objectId ?? this.objectId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object> get props => <Object>[
        date,
      ];

  @override
  Map<String, dynamic> get databaseMapping => <String, dynamic>{
        'a': a,
        'b': b,
        'c': c,
        'd': d,
        'datetime': date,
      };

  bool _checkHasNullValues() {
    if (a == null || b == null || c == null || d == null) {
      return true;
    }

    return false;
  }

  bool _checkHasAnyValue() {
    if (a != null || b != null || c != null || d != null) {
      return true;
    }

    return false;
  }
}
