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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:picos/widgets/picos_body.dart';

/// Shows page for configuration of "Activity & Rest"-information.
class ConfigurationActivityAndRest extends StatefulWidget {
  /// Constructor of page for configuration of "Activity & Rest"-information.
  const ConfigurationActivityAndRest({
    required this.callbackActivityAndRest,
    Key? key,
  }) : super(key: key);

  /// Callback function for activity and rest.
  final void Function(String, bool) callbackActivityAndRest;

  @override
  State<ConfigurationActivityAndRest> createState() =>
      _ConfigurationActivityAndRestState();
}

class _ConfigurationActivityAndRestState
    extends State<ConfigurationActivityAndRest> {
  /// Local variable for walk distance.
  bool _entryWalkDistanceEnabled = false;

  /// Local variable for sleep duration.
  bool _entrySleepDurationEnabled = false;

  /// Local variable for sleep quality.
  bool _entrySleepQualityEnabled = false;

  @override
  Widget build(BuildContext context) {
    return PicosBody(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '''${AppLocalizations.of(context)!.infoText1} '''
                  '''"${AppLocalizations.of(context)!.activityAndRest}" '''
                  '''${AppLocalizations.of(context)!.infoText2}''',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SwitchListTile(
                value: _entryWalkDistanceEnabled,
                onChanged: (bool value) {
                  setState(() {
                    widget.callbackActivityAndRest(
                      'entryWalkDistanceEnabled',
                      value,
                    );
                    _entryWalkDistanceEnabled = value;
                  });
                },
                secondary: const Icon(Icons.directions_walk_outlined),
                title: Text(
                  AppLocalizations.of(context)!.walkDistance,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                shape: const Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              SwitchListTile(
                value: _entrySleepDurationEnabled,
                onChanged: (bool value) {
                  setState(() {
                    widget.callbackActivityAndRest(
                      'entrySleepDurationEnabled',
                      value,
                    );
                    _entrySleepDurationEnabled = value;
                  });
                },
                secondary: const Icon(Icons.access_alarm_outlined),
                title: Text(
                  AppLocalizations.of(context)!.sleepDuration,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                shape: const Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              SwitchListTile(
                value: _entrySleepQualityEnabled,
                onChanged: (bool value) {
                  setState(() {
                    widget.callbackActivityAndRest(
                      'entrySleepQualityEnabled',
                      value,
                    );
                    _entrySleepQualityEnabled = value;
                  });
                },
                secondary: const Icon(Icons.bed_outlined),
                title: Text(
                  AppLocalizations.of(context)!.sleepQuality,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                shape: const Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
