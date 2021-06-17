/*
 * Copyright 2021 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'builder.dart';
import 'velocityx_mixins/color_mixin.dart';

/// A widget that uses the table layout algorithm for its children.
class VxTable extends VxWidgetBuilder<Widget> with VxColorMixin<VxTable> {
  VxTable(
      {this.tableBorder,
      this.columnWidths,
      this.defaultColumnWidth = const FlexColumnWidth(1.0),
      this.defaultVerticalAlignment = TableCellVerticalAlignment.top,
      this.textBaseline,
      this.textDirection,
      this.children = const <TableRow>[]}) {
    setChildToColor(this);
  }

  TableBorder? tableBorder;
  Map<int, TableColumnWidth>? columnWidths;
  TableColumnWidth defaultColumnWidth;
  TableCellVerticalAlignment defaultVerticalAlignment;
  TextBaseline? textBaseline;
  TextDirection? textDirection;
  final List<TableRow> children;

  VxTable border(TableBorder? _tableBorder) {
    tableBorder = _tableBorder;
    return this;
  }

  VxTable get simpleBorder {
    tableBorder = TableBorder.all(
      color: velocityColor ?? Colors.black,
    );
    return this;
  }

  VxTable setColumnWidths(Map<int, TableColumnWidth>? _columnWidths) {
    columnWidths = _columnWidths;
    return this;
  }

  VxTable withFlexFactor(double flexFactor) {
    columnWidths = children.asMap().map((key, value) =>
        MapEntry<int, TableColumnWidth>(key, FlexColumnWidth(flexFactor)));
    return this;
  }

  VxTable withFixedFactor(double fixedFactor) {
    columnWidths = children.asMap().map((key, value) =>
        MapEntry<int, TableColumnWidth>(key, FixedColumnWidth(fixedFactor)));
    return this;
  }

  VxTable withIntrinsicFactor(double intrinsicFactor) {
    columnWidths = children.asMap().map((key, value) =>
        MapEntry<int, TableColumnWidth>(
            key, IntrinsicColumnWidth(flex: intrinsicFactor)));
    return this;
  }

  VxTable setDefaultColumnWidth(TableColumnWidth _tableColumnWidth) {
    defaultColumnWidth = _tableColumnWidth;
    return this;
  }

  VxTable get topAligned {
    defaultVerticalAlignment = TableCellVerticalAlignment.top;
    return this;
  }

  VxTable get middleAligned {
    defaultVerticalAlignment = TableCellVerticalAlignment.middle;
    return this;
  }

  VxTable get bottomAligned {
    defaultVerticalAlignment = TableCellVerticalAlignment.bottom;
    return this;
  }

  VxTable get fillAligned {
    defaultVerticalAlignment = TableCellVerticalAlignment.fill;
    return this;
  }

  VxTable get baseAligned {
    defaultVerticalAlignment = TableCellVerticalAlignment.baseline;
    return this;
  }

  VxTable setVerticalAlignment(TableCellVerticalAlignment _alignment) {
    defaultVerticalAlignment = _alignment;
    return this;
  }

  VxTable setTextDirection(TextDirection _direction) {
    textDirection = _direction;
    return this;
  }

  VxTable setTextBaseline(TextBaseline _baseline) {
    textBaseline = _baseline;
    return this;
  }

  @override
  Widget make({Key? key}) {
    return Table(
      key: key,
      border: tableBorder,
      columnWidths: columnWidths,
      defaultColumnWidth: defaultColumnWidth,
      defaultVerticalAlignment: defaultVerticalAlignment,
      textBaseline: textBaseline,
      textDirection: textDirection,
      children: children,
    );
  }
}

extension TableExtensions on List<TableRow> {
  ///
  /// Extension method to directly access [VxTable]
  ///
  VxTable get table => VxTable(children: this);
}
