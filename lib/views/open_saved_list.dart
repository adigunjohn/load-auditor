import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:load_auditor/localstorage.dart';

import '../view_models/load_auditor_model.dart';


class OpenSavedListScreen extends StatefulWidget {
  @override
  State<OpenSavedListScreen> createState() => _OpenSavedListScreenState();
}

class _OpenSavedListScreenState extends State<OpenSavedListScreen> {
  // const OpenSavedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Localstorage storedData = localstoragehive.get('yah');
    Localstorage storedData = localstoragehive.get('${Provider.of<LoadAuditorModel>(context, listen: false).savedListName}');
    return Scaffold(
      appBar: AppBar(
        title: Text('${storedData.name} Saved List'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                Text('${storedData.ILDC}'),
                Text('${storedData.ILBC}'),
                Text('${storedData.Iscc}'),
                Text('${storedData.spv}'),
                // SizedBox(height: 20.0,),
                Text('${storedData.suggestedBatterySize}'),
                Text('${storedData.calculatedBatterySize}'),
                Text('${storedData.inverterSize}'),
              ],
            )
        ),
      ),
    );
  }
}
