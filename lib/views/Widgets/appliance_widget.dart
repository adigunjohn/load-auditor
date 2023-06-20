import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/load_auditor_model.dart';

class ApplianceWidget extends StatelessWidget {
  const ApplianceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadAuditorModel>(builder: (context, model, child) {
    return GridView.builder(physics: BouncingScrollPhysics(),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 170.0),
        itemCount: model.applianceCount,
        itemBuilder: (context, index) {
          final app = model.applianceList[index];
          // return appwidget(sn: '', applianceName: 'fan', unit: '15', wattunit: '15', totalPower: '306 Watt', runTime: '20 Hours', energy: '2007 WH');
          return AppWidget(
            applianceName: app.applianceName,
            unit: app.unit,
            wattunit: app.wattunit,
            totalPower: app.totalPower,
            runTime: app.runTime,
            energy: app.energy,
          );
        } );
    });
  }
}

// return ListView.builder(
//         itemCount: model.applianceCount,
//         // itemCount: 2,
//         itemBuilder: (context, index) {
//           final app = model.applianceList[index];
//           // return appwidget(sn: '', applianceName: 'fan', unit: '15', wattunit: '15', totalPower: '306 Watt', runTime: '20 Hours', energy: '2007 WH');
//           return AppWidget(
//             applianceName: app.applianceName,
//             unit: app.unit,
//             wattunit: app.wattunit,
//             totalPower: app.totalPower,
//             runTime: app.runTime,
//             energy: app.energy,
//           );
//         } );


// List<ApplianceCard> applianceList = [
//   ApplianceCard(applianceName: 'Yeah', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
//   ApplianceCard(applianceName: 'Yeahh', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
//   ApplianceCard(applianceName: 'Yeahhh', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
//   ApplianceCard(applianceName: 'Yeahhhh', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
//   // AppWidget(sn: '1', applianceName: 'fan', unit: '15', wattunit: '15', totalPower: '306 Watt', runTime: '20 Hours', energy: '2007 WH'),
//   // AppWidget(sn: '2', applianceName: 'tv', unit: '3', wattunit: '55', totalPower: '726 Watt', runTime: '14 Hours', energy: '6072 WH'),
//   // AppWidget(sn: '1', applianceName: 'fan', unit: '15', wattunit: '15', totalPower: '306 Watt', runTime: '20 Hours', energy: '2007 WH'),
//   // AppWidget(sn: '2', applianceName: 'tv', unit: '3', wattunit: '55', totalPower: '726 Watt', runTime: '14 Hours', energy: '6072 WH'),
// ];

class ApplianceCard {
  const ApplianceCard({required this.applianceName, required this.unit, required this.wattunit, required this.totalPower, required this.runTime, required this.energy});
  final String? applianceName;
  final String? wattunit;
  final String? totalPower;
  final String? runTime;
  final String? energy;
  final String? unit;
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key,required this.applianceName, required this.unit, required this.wattunit, required this.totalPower, required this.runTime, required this.energy}) : super(key: key);
  final String? applianceName;
  final String? wattunit;
  final String? totalPower;
  final String? runTime;
  final String? energy;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0,bottom: 8.0),
      child: InkWell(
        onDoubleTap: (){
          Provider.of<LoadAuditorModel>(context, listen: false).deleteFromList();
          print('yh');
        },
        child: Material(
            borderRadius: BorderRadius.circular(15.0),
          elevation: 10.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0, left: 12.0, right: 1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7.0),
                        child: Text(applianceName.toString().toUpperCase(), style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500
                        ),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Unit: ', style: TextStyle(
                          color: Colors.black
                      ),),
                      Text('${unit.toString()} units', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('Watt/Unit: ', style: TextStyle(
                          color: Colors.black
                      ),),
                      Text('${wattunit.toString()}', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('Total Power: ', style: TextStyle(
                          color: Colors.black
                      ),),
                      Text('$totalPower W', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('Runtime: ', style: TextStyle(
                          color: Colors.black
                      ),),
                      Text('$runTime Hrs', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                  SizedBox(height: 3.0,),
                  Row(
                    children: [
                      Text('Energy: ', style: TextStyle(
                          color: Colors.black
                      ),),
                      Text('${energy.toString()} WH', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500
                      ),),
                    ],
                  ),
                ],
              ),
            ),),
        ),
      ),
    );
  }
}



