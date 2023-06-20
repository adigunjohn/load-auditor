import 'package:flutter/material.dart';
import 'package:load_auditor/view_models/load_auditor_model.dart';
import 'package:load_auditor/views/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'localstorage.dart';



void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(LocalstorageAdapter());
  localstoragehive = await Hive.openBox<Localstorage>('localstorageBox');

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
        debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // home: Homescreen(),
    ),);
  }
}


