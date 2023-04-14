import 'package:flutter/material.dart';
import 'package:load_auditor/views/calc_screen.dart';
import '../view_models/load_auditor_model.dart';
import 'add_appliance_screen.dart';
import 'Widgets/appliance_widget.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      onPressed: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => AddApplianceScreen(
          ),
        );
      },),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              Text('LOAD AUDIT', style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold
              ),),
              Padding(
                padding: const EdgeInsets.only(right: 13.0, left: 13.0, bottom: 10.0, top: 15.0),
                child: Text('Click on the \'Add(plus) button\' to add the appliances, and when you are done you click on the \'next step\' button.', style: TextStyle(
                    fontSize: 14.0,
                ),),
              ),
              Text('Number of Appliances added: ${Provider.of<LoadAuditorModel>(context).applianceCount}', style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),),
              Expanded(child: ApplianceWidget(),),
              SizedBox(height: 30.0,),
              MaterialButton(onPressed: (){
                Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CalcScreen()));

              },child: Text('Next Step ', style: TextStyle(color: Colors.white),),color: Colors.blue,),
              SizedBox(height: 70.0,)
            ],
          ),
        ),
      )
    );
  }
}



