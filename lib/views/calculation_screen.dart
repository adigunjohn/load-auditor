import 'package:flutter/material.dart';
import 'package:load_auditor/views/homescreen.dart';
import 'package:provider/provider.dart';

import '../localstorage.dart';
import '../view_models/load_auditor_model.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  String? yeah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Load Audit'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              elevation: 7.0,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Inverter Sizing',
                                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w500),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Inverter Size:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).approIS} KVA / ${Provider.of<LoadAuditorModel>(context).SuggestedSystemVoltage} V ',
                              style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'Battery Sizing',
                                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Calculated Battery Size:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).batterySizing} Ah',
                              style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Suggested (by you) Battery Size:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).suggestedBattery} Ah',
                              style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                'PV Sizing',
                                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ILDC:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).chargingBatteyCurrentt} A',
                              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ILBC:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0,),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).ssolarChargeControllerSizing} VA',
                              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Iscc:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).solarChargeControllerSizingg} A',
                              style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Spv:',
                              style: TextStyle(color: Colors.black, fontSize: 17.0),
                            ),
                            Text(
                              ' ${Provider.of<LoadAuditorModel>(context).pvSizing} Watt Peak',
                              style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                      ],
                    ),],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      if(yeah != null){
                                        setState(() {
                                          localstoragehive.put(
                                              '${Provider.of<LoadAuditorModel>(context, listen: false).savedListName}',
                                              Localstorage(
                                                  name:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).savedListName}',
                                                  suggestedBatterySize:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).suggestedBattery} Ah',
                                                  calculatedBatterySize:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).batterySizing} Ah',
                                                  ILBC:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).ssolarChargeControllerSizing} VA',
                                                  ILDC:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).chargingBatteyCurrentt} A',
                                                  inverterSize:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).approIS} KVA / ${Provider.of<LoadAuditorModel>(context, listen: false).SuggestedSystemVoltage} V ',
                                                  Iscc:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).solarChargeControllerSizingg} A',
                                                  spv:
                                                  '${Provider.of<LoadAuditorModel>(context, listen: false).pvSizing} Watt Peak'));
                                        });
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             HomeScreen()));
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text('Ok'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                                title: Text('Save'),
                                content: TextField(
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintText: 'Enter a name for the list',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(19.0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(19.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(19.0),
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.5),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    yeah = value;
                                    Provider.of<LoadAuditorModel>(context,
                                            listen: false)
                                        .getSavedListTitle(yeah.toString().toUpperCase());
                                  },
                                ),
                              ));
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      // Provider.of<LoadAuditorModel>(context, listen: false).clearList();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Go To Homepage',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

