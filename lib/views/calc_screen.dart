import 'dart:math';

import 'package:flutter/material.dart';
import 'package:load_auditor/views/calculation_screen.dart';
import 'package:provider/provider.dart';
import '../view_models/load_auditor_model.dart';
import 'calcu_screen.dart';

class CalcScreen extends StatefulWidget {
  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  // const CalcScreen({Key? key}) : super(key: key);
  String? yeah;
 TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Inverter Sizing'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
              child: Container(
                height: MediaQuery.of(context).size.height - 90,
                child: Padding(
          padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, right: 15.0, left: 15.0),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text('Inverter Sizing', style: TextStyle(fontSize: 20.0),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        elevation: 5.0,

                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Real Power',
                                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    '${Provider.of<LoadAuditorModel>(context).realPower} Watts',
                                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Power Factor Used',
                                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    '70%',
                                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Apparent Power',
                                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    '${Provider.of<LoadAuditorModel>(context).apparentPower} VA',
                                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Inverter Size',
                                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(
                                    '${Provider.of<LoadAuditorModel>(context).inverterSizing} VA  /  ${Provider.of<LoadAuditorModel>(context).approIS} KVA',
                                    style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'System voltage',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        controller:  myController,
                        keyboardType: TextInputType.number,
                        // textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Input system voltage i.e 24V',
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
                          Provider.of<LoadAuditorModel>(context, listen: false)
                              .getSystemVoltage(yeah.toString());
                          // Provider.of<LoadAuditorModel>(context, listen: false).getSuggestedBattery(value);
                        },
                      ),
                    ],
                  ),
                  // SizedBox(height: 15.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: MaterialButton(
                          onPressed: () {
                           if(yeah != null){
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => CalcuScreen()));
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
        ),
              ),
            )),
      ),
    );
  }
}

//Padding(
//           padding: const EdgeInsets.only(top: 5.0, bottom: 10.0, right: 15.0, left: 15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Text('Inverter Sizing', style: TextStyle(fontSize: 20.0),),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0,),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0),
//                         child: Text('Real Power: ${Provider.of<LoadAuditorModel>(context).realPower} Watts', style: TextStyle(color: Colors.white),),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
//                         child: Text('Power Factor: 70%', style: TextStyle(color: Colors.white),),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0),
//                         child: Text('Apparent Power: ${Provider.of<LoadAuditorModel>(context).apparentPower} VA', style: TextStyle(color: Colors.white),),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 8.0,right: 15.0,left: 15.0,bottom: 15.0),
//                         child: Text('Inverter Size: ${Provider.of<LoadAuditorModel>(context).inverterSizing} VA', style: TextStyle(color: Colors.white),),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 1.0, bottom: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15.0,right: 15.0,left: 15.0, bottom: 15.0),
//                         child: Text('Inverter Size: ${Provider.of<LoadAuditorModel>(context).approIS} KVA', style: TextStyle(color: Colors.white),),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Text('Input Suggested System voltage', style: TextStyle(fontSize: 20.0),),
//               SizedBox(height: 8.0,),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 // textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   hintText: 'suggest system voltage i.e 24V',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(19.0),
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(19.0),
//                     ),
//                     borderSide: BorderSide(color: Colors.blue, width: 1.5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(19.0),
//                     ),
//                     borderSide: BorderSide(color: Colors.blue, width: 1.5),
//                   ),),
//                 onChanged: (value) {
//                   Provider.of<LoadAuditorModel>(context, listen: false).getSystemVoltage(value);
//                   // Provider.of<LoadAuditorModel>(context, listen: false).getSuggestedBattery(value);
//                 },
//               ),
//               SizedBox(height: 20.0,),],),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
//                     child: MaterialButton(onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => CalcuScreen()));
//                     },child: Text('Next Step', style: TextStyle(color: Colors.white, fontSize: 15.0),),),
//                   ),
//                 ],
//               ),
//
//             ],
//           ),
//         )
