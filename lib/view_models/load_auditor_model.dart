import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:convert';
import '../views/Widgets/appliance_widget.dart';

class LoadAuditorModel extends ChangeNotifier {
  String? applianceName;
  int? unit;
  int? wattunit;
  int? runtime;
  double? alx;
  int? sum;
  int? energysum;
  double? batt;
  int? systemVolt;
  int? suggestedBattery;
  int? numberOfBatteries;
  int? batteryS;
  int? chargeControl;
  int? SuggestedSystemVoltage;
  // int? power;
  // // int power = 8888;
  // int energy = 8999;

  String? savedListName;




  List<ApplianceCard> _applianceList = [
    // ApplianceCard(applianceName: 'Yeah', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
    // ApplianceCard(applianceName: 'Yeahh', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
    // ApplianceCard(applianceName: 'Yeahhh', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
    // ApplianceCard(applianceName: 'Yeahhhh', unit: '15', wattunit: '69', totalPower: '786', runTime: '45', energy: '75848'),
    // AppWidget(sn: '1', applianceName: 'fan', unit: '15', wattunit: '15', totalPower: '306 Watt', runTime: '20 Hours', energy: '2007 WH'),
    // AppWidget(sn: '2', applianceName: 'tv', unit: '3', wattunit: '55', totalPower: '726 Watt', runTime: '14 Hours', energy: '6072 WH'),
    // AppWidget(sn: '1', applianceName: 'fan', unit: '15', wattunit: '15', totalPower: '306 Watt', runTime: '20 Hours', energy: '2007 WH'),
    // AppWidget(sn: '2', applianceName: 'tv', unit: '3', wattunit: '55', totalPower: '726 Watt', runTime: '14 Hours', energy: '6072 WH'),
  ];

  UnmodifiableListView<ApplianceCard> get applianceList {
    return UnmodifiableListView(_applianceList);
  }
  int get applianceCount {
    return _applianceList.length;
  }
/// hive
  void getSavedListTitle(String value) {
    final z = value;
    savedListName = z;
    notifyListeners();
  }


  dynamic get apparentPower {
    alx =  realPower / 0.7;
    return alx!.toStringAsFixed(3);
  }

  dynamic get totalEnergy {
    if (_applianceList.length == 1){
      final c = _applianceList[0].energy.toString();
      energysum = int.parse(c);
    }
    else if (_applianceList.length == 2){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      energysum = int.parse(c) + int.parse(d);
    }
    else if (_applianceList.length == 3){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      final e = _applianceList[2].energy.toString();
      energysum = int.parse(c) + int.parse(d) + int.parse(e);
    }
    else if (_applianceList.length == 4){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      final e = _applianceList[2].energy.toString();
      final f = _applianceList[3].energy.toString();
      energysum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f);
    }
    else if (_applianceList.length == 5){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      final e = _applianceList[2].energy.toString();
      final f = _applianceList[3].energy.toString();
      final g = _applianceList[4].energy.toString();
      energysum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g);
    }
    else if (_applianceList.length == 6){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      final e = _applianceList[2].energy.toString();
      final f = _applianceList[3].energy.toString();
      final g = _applianceList[4].energy.toString();
      final h = _applianceList[5].energy.toString();
      energysum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g) + int.parse(h);
    }
    else if (_applianceList.length == 7){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      final e = _applianceList[2].energy.toString();
      final f = _applianceList[3].energy.toString();
      final g = _applianceList[4].energy.toString();
      final h = _applianceList[5].energy.toString();
      final i = _applianceList[6].energy.toString();
      energysum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g) + int.parse(h) + int.parse(i);
    }
    else if (_applianceList.length == 8){
      final c = _applianceList[0].energy.toString();
      final d = _applianceList[1].energy.toString();
      final e = _applianceList[2].energy.toString();
      final f = _applianceList[3].energy.toString();
      final g = _applianceList[4].energy.toString();
      final h = _applianceList[5].energy.toString();
      final i = _applianceList[6].energy.toString();
      final j = _applianceList[7].energy.toString();
      energysum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g) + int.parse(h) + int.parse(i)  + int.parse(j);
    }

    return energysum;
  }
  dynamic get realPower {
    if (_applianceList.length == 1){
      final c = _applianceList[0].totalPower.toString();
      sum = int.parse(c);
    }
    else if (_applianceList.length == 2){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      sum = int.parse(c) + int.parse(d);
    }
    else if (_applianceList.length == 3){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      final e = _applianceList[2].totalPower.toString();
      sum = int.parse(c) + int.parse(d) + int.parse(e);
    }
    else if (_applianceList.length == 4){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      final e = _applianceList[2].totalPower.toString();
      final f = _applianceList[3].totalPower.toString();
      sum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f);
    }
    else if (_applianceList.length == 5){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      final e = _applianceList[2].totalPower.toString();
      final f = _applianceList[3].totalPower.toString();
      final g = _applianceList[4].totalPower.toString();
      sum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g);
    }
    else if (_applianceList.length == 6){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      final e = _applianceList[2].totalPower.toString();
      final f = _applianceList[3].totalPower.toString();
      final g = _applianceList[4].totalPower.toString();
      final h = _applianceList[5].totalPower.toString();
      sum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g) + int.parse(h);
    }
    else if (_applianceList.length == 7){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      final e = _applianceList[2].totalPower.toString();
      final f = _applianceList[3].totalPower.toString();
      final g = _applianceList[4].totalPower.toString();
      final h = _applianceList[5].totalPower.toString();
      final i = _applianceList[6].totalPower.toString();
      sum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g) + int.parse(h) + int.parse(i);
    }
    else if (_applianceList.length == 8){
      final c = _applianceList[0].totalPower.toString();
      final d = _applianceList[1].totalPower.toString();
      final e = _applianceList[2].totalPower.toString();
      final f = _applianceList[3].totalPower.toString();
      final g = _applianceList[4].totalPower.toString();
      final h = _applianceList[5].totalPower.toString();
      final i = _applianceList[6].totalPower.toString();
      final j = _applianceList[7].totalPower.toString();
      sum = int.parse(c) + int.parse(d) + int.parse(e) + int.parse(f) + int.parse(g) + int.parse(h) + int.parse(i)  + int.parse(j);
    }

    return sum;
  }
  // dynamic get sum {
  //   dynamic? zh;
  //   for (int i= 0; i < _applianceList.length; i++){
  //     zh = print(i);
  //   }


  //   return zh;
  // }


   // dynamic get systemVoltage{
   //   if(alx! <= 1000){
   //     systemVolt = 12;
   //   }
   //   else if(alx! > 1000 && alx! <= 3000){
   //     systemVolt = 24;
   //   }
   //   else if(alx! > 3000 && alx! <= 15000){
   //     systemVolt = 48;
   //   }
   //   else if(alx! > 15000 && alx! <= 20000){
   //     systemVolt = 96;
   //   }
   //   return systemVolt;
   // }

  dynamic get inverterSizing {
    if(alx! < 500){
      alx = 500;
    }
    else if(alx! > 500 && alx! < 1000){
      alx = 1000;
    }
    else if(alx! >= 1000 && alx! < 1500){
      alx = 1500;
    }
    else if(alx! >= 1500 && alx! < 2000){
      alx = 2000;
    }
    else if(alx! >= 2000 && alx! < 2500){
      alx = 2500;
    }
    else if(alx! >= 2500 && alx! < 3000){
      alx = 3000;
    }
    else if(alx! >= 3000 && alx! < 3500){
      alx = 3500;
    }
    else if(alx! >= 3500 && alx! < 4000){
      alx = 4000;
    }
    else if(alx! >= 4000 && alx! < 4500){
      alx = 4500;
    }
    else if(alx! >= 4500 && alx! < 5000){
      alx = 5000;
    }
    else if(alx! >= 5000 && alx! < 5500){
      alx = 5500;
    }
    else if(alx! >= 5500 && alx! < 6000){
      alx = 6000;
    }
    else if(alx! >= 6000 && alx! < 6500){
      alx = 6500;
    }
    else if(alx! >= 6500 && alx! < 7000){
      alx = 7000;
    }
    else if(alx! >= 7000 && alx! < 7500){
      alx = 7500;
    }
    else if(alx! >= 7500 && alx! < 8000){
      alx = 8000;
    }
    else if(alx! >= 8000 && alx! < 8500){
      alx = 8500;
    }
    else if(alx! >= 8500 && alx! < 9000){
      alx = 9000;
    }
    else if(alx! >= 9000 && alx! < 9500){
      alx = 9500;
    }
    else if(alx! >= 9500 && alx! < 10000){
      alx = 10000;
    }
    else if(alx! >= 10000 && alx! < 11500){
      alx = 11500;
    }
    else if(alx! >= 11500 && alx! < 12000){
      alx = 12000;
    }
    else if(alx! >= 12000 && alx! < 12500){
      alx = 12500;
    }
    else if(alx! >= 12500 && alx! < 13000){
      alx = 13000;
    }
    else if(alx! >= 13000 && alx! < 13500){
      alx = 13500;
    }
    else if(alx! >= 13500 && alx! < 14000){
      alx = 14000;
    }
    else if(alx! >= 14000 && alx! < 14500){
      alx = 14500;
    }
    else if(alx! >= 14500 && alx! < 15000){
      alx = 15000;
    }
    else if(alx! >= 15000 && alx! < 5500){
      alx = 15500;
    }
    else if(alx! >= 15500 && alx! < 16000){
      alx = 16000;
    }
    else if(alx! >= 16000 && alx! < 16500){
      alx = 16500;
    }
    else if(alx! >= 6500 && alx! < 7000){
      alx = 17000;
    }
    else if(alx! >= 17000 && alx! < 17500){
      alx = 17500;
    }
    else if(alx! >= 17500 && alx! < 18000){
      alx = 18000;
    }
    else if(alx! >= 18000 && alx! < 18500){
      alx = 18500;
    }
    else if(alx! >= 8500 && alx! < 19000){
      alx = 19000;
    }
    else if(alx! >= 19000 && alx! < 19500){
      alx = 19500;
    }
    else if(alx! >= 19500 && alx! < 20000){
      alx = 20000;
    }
    else if(alx! >= 20000 && alx! < 20500){
      alx = 20500;
    }
    return alx!.round();
  }
  dynamic get approIS {
    final a = alx! / 1000;
    return a;
  }

  dynamic get batterySizing{
      batt = totalEnergy / (SuggestedSystemVoltage! * 0.7);
    return batt!.round();
  }

  //  dynamic get batterySizing{
  //     if(alx! <= 1000){
  //       batt = totalEnergy / (SuggestedSystemVoltage! * 0.7);
  //     }
  //     else if(alx! > 1000 && alx! <= 3000){
  //       batt = totalEnergy/ (SuggestedSystemVoltage! * 0.7);
  //     }
  //     else if(alx! > 3000 && alx! <= 15000){
  //       batt = totalEnergy / (48 * 0.7);
  //     }
  //     else if(alx! > 15000 && alx! <= 20000){
  //       batt = totalEnergy / (96 * 0.7);
  //     }
  //     return batt!.round();
  //   }

  void addNewAppliance(){
    final appList = ApplianceCard(applianceName: '$applianceName', unit: '$unit', wattunit: '$wattunit', totalPower: '$power', runTime: '$runtime', energy: '$energy');
    _applianceList.add(appList);
    notifyListeners();
  }
  void deleteFromList(){
    final appList = ApplianceCard(applianceName: '$applianceName', unit: '$unit', wattunit: '$wattunit', totalPower: '$power', runTime: '$runtime', energy: '$energy');
    _applianceList.remove(appList);
    notifyListeners();
  }
  void clearList(){
    _applianceList.clear();
    notifyListeners();
  }
  // void deleteAppliance (ApplianceCard applianceCard){
    //   _applianceList.remove(applianceCard);
  //   notifyListeners();
  // }
  dynamic get power{
    return wattunit! * unit!;
}
  dynamic get energy{
    return wattunit! * unit! * runtime!;
  }

//'${wattunit! * unit!}'

  // void calculatePower(){
  //   var e = unit! * wattunit!;
  //   power = e;
  //   notifyListeners();
  // }

void getApplianceName(String value) {
  applianceName  = value;
  notifyListeners();
}
  void getUnit(String value) {
    final b = value;
    unit = int.parse(b);
    notifyListeners();
  }
  void getWattUnit(String value) {
    final c = value;
    wattunit = int.parse(c);
    notifyListeners();
  }
  void getRunTime(String value) {
    final d = value;
    runtime = int.parse(d);
    notifyListeners();
  }

  void getSuggestedBattery (String value){
    final a =int.parse(value);
    suggestedBattery = a;
    notifyListeners();
  }
  void getSystemVoltage (String value){
    final s = int.parse(value);
    SuggestedSystemVoltage = s;
    notifyListeners();
  }

  void getNumberOfBatteries (String value){
    final a =int.parse(value);
    numberOfBatteries = a;
    notifyListeners();
  }
  void getBatteryS (String value){
    final a =int.parse(value);
    batteryS = a;
    notifyListeners();
  }

  dynamic get chargingBatteyCurrent {
    double a = realPower / 230;
    double b = a / 1.414;
    // return b.round();
    return b;
  }

  ///for calculation screen display
  dynamic get chargingBatteyCurrentt {
    double a = realPower / 230;
    double b = a / 1.414;
    // return b.round();
    return b.toStringAsFixed(3);
  }

  dynamic get ssolarChargeControllerSizing {
    dynamic a = 0.1 * (batteryS! * numberOfBatteries!);
    return a.round();
  }
  dynamic get solarChargeControllerSizing {
    dynamic b = chargingBatteyCurrent + ssolarChargeControllerSizing;
    return b;
  }
  ///for calculation screen display
  dynamic get solarChargeControllerSizingg {
    dynamic b = chargingBatteyCurrent + ssolarChargeControllerSizing;
    return b.toStringAsFixed(3);
  }


  dynamic get solarCC {
    if(solarChargeControllerSizing < 10){
      chargeControl = 10;
    }
    else if (solarChargeControllerSizing > 10 && solarChargeControllerSizing < 20){
      chargeControl = 20;
    }
    else if (solarChargeControllerSizing > 20 && solarChargeControllerSizing < 30){
      chargeControl = 30;
    }
    else if (solarChargeControllerSizing > 30 && solarChargeControllerSizing < 40){
      chargeControl = 40;
    }
    else if (solarChargeControllerSizing > 40 && solarChargeControllerSizing < 60){
      chargeControl = 60;
    }
    else if (solarChargeControllerSizing > 60 && solarChargeControllerSizing < 70){
      chargeControl = 70;
    }
    else if (solarChargeControllerSizing > 70 && solarChargeControllerSizing < 80){
      chargeControl = 80;
    }
    else if (solarChargeControllerSizing > 80 && solarChargeControllerSizing < 90){
      chargeControl = 90;
    }
    else if (solarChargeControllerSizing > 90 && solarChargeControllerSizing < 100){
      chargeControl = 100;
    }
    return chargeControl;
  }

  // dynamic get solarChargeControllerSizing {
  //     double a = 0.1 * (batteryS! * numberOfBatteries!);
  //     double b = chargingBatteyCurrent + a;
  //     return b.round();
  //   }

  dynamic get pvSizing {
    var a = SuggestedSystemVoltage! * solarChargeControllerSizing;
    return a.round();
  }

  //  void updateAddNewTask (String newlyAddedTask){
//     final task = Task(text: newlyAddedTask);
//     _tasks.add(task);
//     notifyListeners();
//   }

//    void updateTask (Task task){
//     task.changeIsDone();
//     notifyListeners();
//    }








}