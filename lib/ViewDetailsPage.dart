
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ActiveLeavePage.dart';
import 'package:flutter_application_1/DeletedLeavePage.dart';

class ViewDetailsPage extends StatefulWidget {
    final Map<String, String> leaves; 
       final List<Map<String, String>> Deletedleaves; 


  const ViewDetailsPage({super.key,required this.leaves,required this.Deletedleaves});

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("View details")),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ActiveLeavePage(leaves: widget.leaves),));


          }, child: Text("Active leave")),
          SizedBox(
            height: 20,
            
          ),
          ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DeletedLeavePage(Deletedleaves: widget.Deletedleaves),));

            

          }, child: Text("Deleted Leaves"))
        ],
      ),


    );
  }
}