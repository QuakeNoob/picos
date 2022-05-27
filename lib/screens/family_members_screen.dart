/*   This file is part of Picos, a health trcking mobile app
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
import 'package:picos/screens/family_members_add_screen.dart';

/// builds 'Column' as a parent widget for the given cards
class MyCard extends StatelessWidget {
  // ignore: public_member_api_docs
  MyCard({Key? key}) : super(key: key) {
    // TODO: Internatilize it
    /// A fixed list of Strings denoting the type of family members
    List<String> familyMemberType = <String>[
      'Vater',
      'Mutter',
      'Bruder',
      'Schwester',
    ];

    /// generates a list of CustomCard-Widgets
    cards = List<CustomCard>.generate(
      familyMemberType.length,
      (int index) => CustomCard(
        memberType: familyMemberType.elementAt(index),
      ),
    );
  }

  /// Declaration of the List-variable 'cards' for building
  /// the main components of the UI of this screen
  late final List<CustomCard> cards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cards,
    );
  }
}

/// This class serves for customizing the card properties showing information
/// about the corresponding family member
class CustomCard extends StatelessWidget {
  // ignore: public_member_api_docs
  const CustomCard({
    required this.memberType,
    Key? key,
  }) : super(key: key);

  /// initialized memberType-variable which is used to
  /// show the family member type
  final String memberType;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              tileColor: const Color.fromRGBO(
                25,
                102,
                117,
                1.0,
              ),
              textColor: Colors.white,
              title: Text(
                memberType,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 20,
                right: 16,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Herr Max Mustermann',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Musterstraße 1'),
                  Text('00000 Musterstadt'),
                  Text('Tel. +49 000 12 34 56'),
                  Text('name@webmail.de'),
                ],
              ),
            ),
            BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(
                              232,
                              241,
                              243,
                              1,
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            // TODO: Internatilize it
                            'Bearbeiten',
                            style: TextStyle(
                              color: Color.fromRGBO(
                                95,
                                115,
                                131,
                                1,
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(
                              232,
                              241,
                              243,
                              1,
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            // TODO: Internatilize it
                            'Löschen',
                            style: TextStyle(
                              color: Color.fromRGBO(
                                95,
                                115,
                                131,
                                1,
                              ),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// This is the screen in which a user will see a list of his family members
class FamilyMembers extends StatelessWidget {
  // ignore: public_member_api_docs
  const FamilyMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Internatilize it
        title: const Text('Meine Angehörigen'),
        backgroundColor: const Color.fromRGBO(
          25,
          102,
          117,
          1.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(
            232,
            241,
            243,
            1,
          ),
          child: MyCard(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color.fromRGBO(
                          149,
                          193,
                          31,
                          1,
                        ),
                        Color.fromRGBO(
                          110,
                          171,
                          39,
                          1,
                        ),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) =>
                            const FamilyMembersAdd(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      // TODO: Internatilize it
                      'Hinzufügen',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
