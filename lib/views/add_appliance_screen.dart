import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/load_auditor_model.dart';


class AddApplianceScreen extends StatefulWidget {
  @override
  State<AddApplianceScreen> createState() => _AddApplianceScreenState();
}

class _AddApplianceScreenState extends State<AddApplianceScreen> {
  // const AddApplianceScreen({Key? key}) : super(key: key);
 String? yeah;

 String? yeahh;

 String? yeahhh;

 String? yeahhhh;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadAuditorModel>(builder: (context, model, child) {
      return Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: IntrinsicHeight(
            child: Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15.0,),
                  Center(child: Text('Add New Appliance', style: TextStyle(color: Colors.blue, fontSize: 23.0, fontWeight: FontWeight.w500),)),
                  SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 2.3,
                        child: TextField(
                          // keyboardType: TextInputType.number,
                          // textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),),
                          onChanged: (value) {
                            yeah = value;
                            model.getApplianceName(yeah.toString());
                          },
                        ),
                      ),
                      SizedBox( width: MediaQuery.of(context).size.width / 2.3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          // textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'unit(s)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),),
                          onChanged: (value) {
                            yeahh = value;
                            model.getUnit(yeahh.toString());
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox( width: MediaQuery.of(context).size.width / 2.3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          // textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'watt/unit (watt)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),),
                          onChanged: (value) {
                            yeahhh = value;
                            model.getWattUnit(yeahhh.toString());
                          },
                        ),
                      ),
                      SizedBox( width: MediaQuery.of(context).size.width / 2.3,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          // textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'runtime (hours)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(19.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue, width: 1.5),
                            ),),
                          onChanged: (value) {
                            yeahhhh = value;
                            model.getRunTime(yeahhhh.toString());
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue, borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(onPressed: (){
                           if (yeah != null && yeahh != null && yeahhh != null && yeahhhh != null ){
                             model.addNewAppliance();
                             Navigator.pop(context);
                           }
                        },child: Text('Add Appliance', style: TextStyle(color: Colors.white, fontSize: 15.0),),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    ),
          ),
        ),
      );});
  }
}
