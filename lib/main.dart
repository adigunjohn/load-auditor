import 'package:flutter/material.dart';
import 'package:load_auditor/view_models/load_auditor_model.dart';
import 'package:load_auditor/views/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoadAuditor());
}
class LoadAuditor extends StatelessWidget {
  const LoadAuditor({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoadAuditorModel>(create: (context){
      return LoadAuditorModel();
    },
      child: MaterialApp(
      home: HomeScreen(),
      // home: Homescreen(),
    ),);
  }
}


