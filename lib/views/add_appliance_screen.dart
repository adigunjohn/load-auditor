import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/load_auditor_model.dart';


class AddApplianceScreen extends StatelessWidget {
  // const AddApplianceScreen({Key? key}) : super(key: key);
 String? yeah;
 String? yeahh;
 String? yeahhh;
 String? yeahhhh;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<LoadAuditorModel>(builder: (context, model, child) {
        return Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15.0,),
            Center(child: Text('Add Appliance', style: TextStyle(color: Colors.blue, fontSize: 23.0),)),
            SizedBox(height: 15.0,),
            TextField(
              // keyboardType: TextInputType.number,
              // textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'appliance\'s name',
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
            SizedBox(height: 8.0,),
            TextField(
              keyboardType: TextInputType.number,
              // textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'applliance\'s unit',
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
            SizedBox(height: 8.0,),
            TextField(
              keyboardType: TextInputType.number,
              // textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'appliance\'s watt/unit (watt)',
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
            SizedBox(height: 8.0,),
            TextField(
              keyboardType: TextInputType.number,
              // textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'appliance\'s runtime (hours)',
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
            SizedBox(height: 15.0,),
            MaterialButton(onPressed: (){
                model.addNewAppliance();
                Navigator.pop(context);
            },child: Text('Add Appliance', style: TextStyle(color: Colors.white, fontSize: 15.0),),color: Colors.blue,),
            SizedBox(height: 250.0,),
          ],
        ),
      );}),
    );
  }
}
