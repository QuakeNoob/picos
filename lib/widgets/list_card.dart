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

import 'package:flutter/material.dart';

import '../themes/global_theme.dart';

/// Card item for displaying in a list.
class ListCard extends StatelessWidget {
  /// Creates a card.
  const ListCard({
    required this.title,
    required this.child,
    this.edit,
    this.delete,
    Key? key,
  }) : super(key: key);

  /// Function to edit the card.
  final Function()? edit;
  /// Function to delete the card.
  final Function()? delete;
  /// Title shown on the card.
  final String title;
  /// The content displayed inside the card.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(10);

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 5,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: edit ?? () {},
          onLongPress: delete ?? () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Ink(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  color: Theme.of(context).extension<GlobalTheme>()!.darkGreen2,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
