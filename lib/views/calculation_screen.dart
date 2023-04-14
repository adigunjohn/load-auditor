import 'package:flutter/material.dart';
import 'package:load_auditor/views/homescreen.dart';
import 'package:provider/provider.dart';

import '../view_models/load_auditor_model.dart';

class CalculationScreen extends StatelessWidget {
  const CalculationScreen({Key? key}) : super(key: key);

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
                  Text('SCC Sizing', style: TextStyle(fontSize: 20.0),),
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
                            child: Text('ILDC: ${Provider.of<LoadAuditorModel>(context).chargingBatteyCurrent} A', style: TextStyle(color: Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
                            child: Text('ILBC: ${Provider.of<LoadAuditorModel>(context).ssolarChargeControllerSizing} VA', style: TextStyle(color: Colors.white),),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
                          //   child: Text('Scc: unknown A', style: TextStyle(color: Colors.white),),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0,bottom: 15.0),
                            child: Text('Iscc: ${Provider.of<LoadAuditorModel>(context).solarChargeControllerSizing} A', style: TextStyle(color: Colors.white),),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Text('PV Sizing', style: TextStyle(fontSize: 20.0),),
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
                            child: Text('Spv: ${Provider.of<LoadAuditorModel>(context).pvSizing} Watt Peak', style: TextStyle(color: Colors.white),),
                          ),


                        ],
                      ),
                    ),
                  ),
                  Text('Battery Sizing', style: TextStyle(fontSize: 20.0),),
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
                            child: Text('Calculated Battery Size: ${Provider.of<LoadAuditorModel>(context).batterySizing} Ah', style: TextStyle(color: Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0,left: 15.0, bottom: 15.0),
                            child: Text('Suggested (by you) Battery Size: ${Provider.of<LoadAuditorModel>(context).suggestedBattery} Ah', style: TextStyle(color: Colors.white),),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Text('Inverter Sizing', style: TextStyle(fontSize: 20.0),),
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
                            child: Text('Inverter Size: ${Provider.of<LoadAuditorModel>(context).approIS} KVA / ${Provider.of<LoadAuditorModel>(context).systemVoltage} V ', style: TextStyle(color: Colors.white),),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  MaterialButton(onPressed: (){
                    Provider.of<LoadAuditorModel>(context, listen: false).clearList();
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },child: Text('Done ', style: TextStyle(color: Colors.white),),color: Colors.blue,),
                ],
              ),
            ),
          )
      ),
    );
  }
}


// Text('${Provider.of<LoadAuditorModel>(context).inverterSizing} KVA'