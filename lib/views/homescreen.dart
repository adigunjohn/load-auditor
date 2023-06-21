import 'package:flutter/material.dart';
import 'package:load_auditor/views/calc_screen.dart';
import 'package:load_auditor/views/instruction_screen.dart';
import 'package:load_auditor/views/saved_list_screen.dart';
import '../view_models/load_auditor_model.dart';
import 'add_appliance_screen.dart';
import 'Widgets/appliance_widget.dart';
import 'package:provider/provider.dart';
import 'package:load_auditor/views/Widgets/floating_button.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popUp();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller!.dispose();
    popUp();
  }

  popUp() async {
    await Future.delayed(const Duration(seconds: 5), (){
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quick Guide'),
            IconButton(onPressed: () {
                Navigator.pop(context);
            }, icon: Icon(Icons.close))
          ],
        ),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.circle, size: 10.0,),
                  ),
                  SizedBox(width: 3.0,),
                  Container(width: MediaQuery.of(context).size.width / 1.7, child: Text('Click on the add \'+\' button to add appliances.',)),
                ],),
              SizedBox(height: 3.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.circle, size: 10.0,),
                  ),
                  SizedBox(width: 3.0,),
                  Container(width: MediaQuery.of(context).size.width / 1.7, child: Text('Click on the remove \'-\' button to clear all the added appliances.',)),
                ],),
              SizedBox(height: 3.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.circle, size: 10.0,),
                  ),
                  SizedBox(width: 3.0,),
                  Container(width: MediaQuery.of(context).size.width / 1.7, child: Text('Click on the double arrow \'>>\' button after you are done adding the appliances for the next step.',)),
                ],),
              SizedBox(height: 3.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.circle, size: 10.0,),
                  ),
                  SizedBox(width: 3.0,),
                  Container(width: MediaQuery.of(context).size.width / 1.7, child: Text(' You can double tap on the added appliance or saved (appliance) list to delete. ',)),
                ],),
              SizedBox(height: 3.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.circle, size: 10.0,),
                  ),
                  SizedBox(width: 3.0,),
                  Container(width: MediaQuery.of(context).size.width / 1.7, child: Text('Click on the menu button and select Instructions for more guide.',)),
                ],),
            ],
          ),
        ),

      ));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Load Auditor',),actions: [
        IconButton(onPressed: (){
         if(Provider.of<LoadAuditorModel>(context,listen: false).applianceCount != 0){
           Navigator.push(context,
               MaterialPageRoute(builder: (context) => CalcScreen()));
         }
        }, icon: Icon(Icons.double_arrow, size: 30.0,)),
      ],),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: Column(
          children: [
            SizedBox(height: 35.0,),
            ListTile(title: Text('Saved List', style: TextStyle(color: Colors.blue.shade800, fontSize: 16.0),),trailing: Icon(Icons.favorite, color: Colors.blue,),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SavedListScreen()));
            },),
            Divider(color: Colors.blue,),
            ListTile(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InstructionScreen()));
            },title: Text('Instructions', style: TextStyle(color: Colors.blue.shade800, fontSize: 16.0),),trailing: Icon(Icons.integration_instructions_outlined, color: Colors.blue,),),
            Divider(color: Colors.blue,),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      // onPressed: (){
      //   showModalBottomSheet(
      //     context: context,
      //     builder: (context) => AddApplianceScreen(
      //     ),
      //   );
      // },),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Your Load Audits done in seconds...', style: TextStyle(
                            fontSize: 28.0,fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold, color: Colors.white
                        ),textAlign: TextAlign.center,),
                        SizedBox(height: 8.0,),
                        Text('\"More features are incoming\"', style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white
                        ),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Provider.of<LoadAuditorModel>(context).applianceCount == 0 ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('The list is empty, click on add button to add appliances.'),),
                    SizedBox(height: 15.0,),
                    Icon(Icons.auto_delete_outlined, size: 100.0,color: Colors.black45,),
                  ],
                ) : ApplianceWidget(),),
              SizedBox(height: 3.0,),
              Padding(
                padding: const EdgeInsets.only(right: 12.0, bottom: 4.0, left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 3.5),
                              borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 2,),
                                Text('${Provider.of<LoadAuditorModel>(context).applianceCount}', style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold, color: Colors.black,fontStyle: FontStyle.italic,
                                ),),
                                SizedBox(width: 5.0,),
                                Text('Appliance(s) added', style: TextStyle(
                                    fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,
                                ),),
                                SizedBox(width: 3.0,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(onPressed: (){
                          // showBottomSheet(context: context, builder: (context) => AddApplianceScreen(
                          // ),);
                          // BottomSheet(onClosing: (){}, builder: (context) => AddApplianceScreen(
                          // ),);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => AddApplianceScreen(
                            ),
                          );
                        },child: Icon(Icons.add_circle_outline_rounded),),
                        SizedBox(width: 7.0,),
                        FloatingActionButton(onPressed: (){
                          showDialog(context: context, builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: (){
                                  Provider.of<LoadAuditorModel>(context, listen: false).clearList();
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
                            content: Text('Are you sure you want to delete all the list?')
                          ));

                        },child: Icon(Icons.remove_circle_outline_rounded),),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 1.0, bottom: 1.0),
              //     child: MaterialButton(
              //       height: 1.0,
              //       onPressed: (){
              //       // Navigator.push(context,
              //       //       MaterialPageRoute(builder: (context) => CalcScreen()));
              //         Provider.of<LoadAuditorModel>(context, listen: false).clearList();
              //       print('cleared');
              //     },child: Text('Clear List', style: TextStyle(color: Colors.white),),),
              //   ),
              // ),
            ],
          ),
        ),
      )
    );
  }
}



