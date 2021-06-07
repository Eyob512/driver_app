import 'package:driver_app/AllScreens/mainscreen.dart';
import 'package:driver_app/AllWidgets/ConfigMaps.dart';
import 'package:driver_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatelessWidget {

  static const String idScreen = "carinfo";
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carPlateTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.0,),
              Image.asset("Images/logo.png", width: 390.0, height: 250.0,),
              Padding(
                padding: EdgeInsets.fromLTRB(22.0, 22.0, 22.0, 32.0),
                child: Column(
                  children: [
                    SizedBox(height: 12.0,),
                    Text("Enter Car Details", style: TextStyle(fontFamily: "Brand-Bold", fontSize: 24.0,),),

                    SizedBox(height: 26.0,),
                    TextField(
                      controller: carModelTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Car Model",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0,),
                      ),
                      style: TextStyle(fontSize: 15.0,),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: carPlateTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Car Plate",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0,),
                      ),
                      style: TextStyle(fontSize: 15.0,),
                    ),

                    SizedBox(height: 10.0,),
                    TextField(
                      controller: carColorTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Car Color",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0,),
                      ),
                      style: TextStyle(fontSize: 15.0,),
                    ),

                    SizedBox(height: 42.0,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: RaisedButton(
                        onPressed: (){
                          if(carModelTextEditingController.text.isEmpty){
                            displayToastMessage("Please enter car model", context);
                          }
                          else if(carPlateTextEditingController.text.isEmpty){
                            displayToastMessage("Please enter car plate", context);
                          }
                          else if(carColorTextEditingController.text.isEmpty){
                            displayToastMessage("Please enter car color", context);
                          }
                          else{
                            saveDriverCarInfo(context);
                          }

                        },
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.all(17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Next", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 26.0,),
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDriverCarInfo(context){
    String userId = currentfirebaseUser.uid;
    Map carInfoMap = {
      "car_model": carModelTextEditingController.text,
      "car_plate": carPlateTextEditingController.text,
      "car_color": carColorTextEditingController.text,
    };
    driversRef.child("car_details").set(carInfoMap);
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
  }

  displayToastMessage(String message, BuildContext context){
    Fluttertoast.showToast(msg:message);
  }
}
