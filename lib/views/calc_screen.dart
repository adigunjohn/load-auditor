import 'package:flutter/material.dart';
import 'package:load_auditor/views/calculation_screen.dart';
import 'package:provider/provider.dart';
import '../view_models/load_auditor_model.dart';


class CalcScreen extends StatelessWidget {
  // const CalcScreen({Key? key}) : super(key: key);
String? yeah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Inverter Sizing', style: TextStyle(fontSize: 20.0),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0),
                          child: Text('Real Power: ${Provider.of<LoadAuditorModel>(context).realPower} Watts', style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
                          child: Text('Power Factor: 70%', style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
                          child: Text('Apparent Power: ${Provider.of<LoadAuditorModel>(context).apparentPower} VA', style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0,bottom: 15.0),
                          child: Text('Inverter Size: ${Provider.of<LoadAuditorModel>(context).inverterSizing} VA', style: TextStyle(color: Colors.white),),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0, bottom: 15.0),
                          child: Text('Inverter Size: ${Provider.of<LoadAuditorModel>(context).approIS} KVA / ${Provider.of<LoadAuditorModel>(context).systemVoltage} V', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text('Battery Sizing', style: TextStyle(fontSize: 20.0),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0),
                        //   child: Text('Real Power: ${Provider.of<LoadAuditorModel>(context).realPower} Watts', style: TextStyle(color: Colors.white),),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
                          child: Text('DOD: 70%', style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0, bottom: 8.0),
                          child: Text('Battery Size: ${Provider.of<LoadAuditorModel>(context).batterySizing} AH', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text('Battery Details', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 15.0,),
                Center(child: Text('Add Suggestions', style: TextStyle(color: Colors.blue, fontSize: 18.0),)),
                SizedBox(height: 8.0,),
                TextField(
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'approximated battery size(Ah) i.e 400Ah ',
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
                    Provider.of<LoadAuditorModel>(context, listen: false).getSuggestedBattery(value);
                  },
                ),
                SizedBox(height: 8.0,),
                TextField(
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'number of batteries i.e 5 pieces of battery',
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
                    print(yeah);
                    Provider.of<LoadAuditorModel>(context, listen: false).getNumberOfBatteries(yeah.toString());
                  },
                ),
                SizedBox(height: 8.0,),
                TextField(
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'battery size to be used i.e 100Ah',
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
                    Provider.of<LoadAuditorModel>(context, listen: false).getBatteryS(value);
                  },
                ),
                SizedBox(height: 15.0,),
                MaterialButton(onPressed: (){
                  if(yeah != null) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CalculationScreen()));
                  }
                },child: Text('Next Step', style: TextStyle(color: Colors.white, fontSize: 15.0),),color: Colors.blue,),

              ],
            ),
          ),
        )
      ),
    );
  }
}
