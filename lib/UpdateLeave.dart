import 'package:flutter/material.dart';

class UpdateLeavePage extends StatefulWidget {
  const UpdateLeavePage({super.key});

  @override
  State<UpdateLeavePage> createState() => _updateLeaveState();
}

class _updateLeaveState extends State<UpdateLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("update Leave"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: "Enter the name of staff you want to update "
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){

          }, child: Text("Submit"))
        ],
      ),
     
    );
  }
}