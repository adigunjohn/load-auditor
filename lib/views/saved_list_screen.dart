import 'package:flutter/material.dart';
import 'package:load_auditor/views/open_saved_list.dart';
import 'package:provider/provider.dart';
import 'package:load_auditor/localstorage.dart';

import '../view_models/load_auditor_model.dart';

class SavedListScreen extends StatefulWidget {
  const SavedListScreen({Key? key}) : super(key: key);

  @override
  State<SavedListScreen> createState() => _SavedListScreenState();
}

class _SavedListScreenState extends State<SavedListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved List [${localstoragehive.length}]'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: (){
                  setState(() {
                    localstoragehive.clear();
                  });
                  Navigator.pop(context);
                  print('cleared');
                },
                child: Text('Ok'),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
            title: Text('Confirm'),
            content: Text('Are you sure you want to delete all the Saved list?')
        ));
      },child: Icon(Icons.delete, color: Colors.blue,), backgroundColor: Colors.white,),
      body: Container(
        child: Column(
          children: [
            // Text('These are your stored list-data --${localstoragehive.length}'),
            Container(
              child: Expanded(
                child: localstoragehive.length == 0 ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('There are no saved list.'),),
                    SizedBox(height: 15.0,),
                    Icon(Icons.hourglass_empty_rounded, size: 100.0,color: Colors.black45,),
                  ],
                ) : ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: localstoragehive.length,
                    itemBuilder: (context, index) {
                      Localstorage storedData = localstoragehive.getAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue,
                      ),
                      child: Column(
                        children: [
                          InkWell(child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(' ${storedData.name}', style: TextStyle(color: Colors.white, fontSize: 25.0,  fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Column(
                                    children: [
                                      Text('ILDC ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.ILDC}', style: TextStyle(color: Colors.white, fontSize: 20.0,  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 15.0,),
                                  Column(
                                    children: [
                                      Text('ILBC ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.ILBC}', style: TextStyle(color: Colors.white, fontSize: 20.0,  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 15.0,),
                                  Column(
                                    children: [
                                      Text('Iscc ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.Iscc}', style: TextStyle(color: Colors.white, fontSize: 20.0,  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 15.0,),
                                  Column(
                                    children: [
                                      Text('Spv ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.spv}', style: TextStyle(color: Colors.white, fontSize: 20.0,  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 20.0,),
                                  Column(
                                    children: [
                                      Text('Suggested (by you) Battery Size ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.suggestedBatterySize}', style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 15.0,),
                                  Column(
                                    children: [
                                      Text('Calculated Battery Size ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.calculatedBatterySize}', style: TextStyle(color: Colors.white, fontSize: 22.0,  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 15.0,),
                                  Column(
                                    children: [
                                      Text('Inverter size ', style: TextStyle(color: Colors.white, fontSize: 15.0)),
                                      SizedBox(height: 3.0,),
                                      Text('${storedData.inverterSize}', style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ),onTap: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => OpenSavedListScreen()));
                          },
                          onDoubleTap: (){
                            setState(() {
                              localstoragehive.deleteAt(index);
                              print('list successfull deleted');
                            });
                          },)
                        ],
                      ),
                    ),
                  );
                })
              ),
            ),
            // SizedBox(
            //   height: 70,
            //   child: MaterialButton(
            //     minWidth: MediaQuery.sizeOf(context).width,
            //     color: Colors.blue,
            //     child: Text('Detele All', style: TextStyle(color: Colors.white),),
            //     onPressed: () {
            //
            //     },
            //   ),
            // ),
          ],
        ),
      )
    );
  }
}
