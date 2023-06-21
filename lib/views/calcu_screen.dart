import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:load_auditor/view_models/load_auditor_model.dart';

import 'calculation_screen.dart';

class CalcuScreen extends StatefulWidget {
  const CalcuScreen({Key? key}) : super(key: key);

  @override
  State<CalcuScreen> createState() => _CalcuScreenState();
}

class _CalcuScreenState extends State<CalcuScreen> {
  String? yeah;
  String? yeahh;
  String? yeahhh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Battery Sizing'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Material(
                  color: Colors.white,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Column(
                        //   children: [
                        //     Text(
                        //       'Inverter Size',
                        //       style: TextStyle(color: Colors.black, fontSize: 18.0),
                        //     ),
                        //     SizedBox(height: 5.0,),
                        //     Text(
                        //       '${Provider.of<LoadAuditorModel>(context).inverterSizing} VA  /  ${Provider.of<LoadAuditorModel>(context).approIS} KVA',
                        //       style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0),
                        //     ),
                        //   ],
                        // ),

                        Column(
                          children: [
                            Text(
                              'Depth of Dischage -- DOD',
                              style: TextStyle(color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              '70%',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Battery Size',
                              style: TextStyle(color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(height: 5.0,),
                            Text(
                              '${Provider.of<LoadAuditorModel>(context).batterySizing} AH',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  'Battery Details Suggestions',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 12.0,
                ),
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
                    ),
                  ),
                  onChanged: (value) {
                    yeahhh = value;
                    Provider.of<LoadAuditorModel>(context, listen: false)
                        .getSuggestedBattery(value);
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
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
                    ),
                  ),
                  onChanged: (value) {
                    yeah = value;
                    print(yeah);
                    Provider.of<LoadAuditorModel>(context, listen: false)
                        .getNumberOfBatteries(yeah.toString());
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
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
                    ),
                  ),
                  onChanged: (value) {
                    yeahh = value;
                    Provider.of<LoadAuditorModel>(context, listen: false)
                        .getBatteryS(value);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blue),
                  child: MaterialButton(
                    onPressed: () {
                      if (yeah != null && yeahh != null && yeahhh != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CalculationScreen()));
                      }
                    },
                    child: Text(
                      'Next Step',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
