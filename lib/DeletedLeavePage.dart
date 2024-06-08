import 'package:flutter/material.dart';

class DeletedLeavePage extends StatelessWidget {
   final List<Map<String, String>> Deletedleaves; 
  const DeletedLeavePage({super.key,required this.Deletedleaves});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deleted Leave details"),
        
      ),
      body: Deletedleaves.isEmpty
                ? Center(child: Text('No Deleted leaves are currently stored.'))
                :ListView(
                   children: Deletedleaves.map((leave) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: leave.entries.map((entry) {
                    return ListTile(
                      title: Text('Staff: ${entry.key}'),
                      subtitle: Text(entry.value),
                    );
                  }
                  ).toList(),
                );
              }
              ).toList(),
            ),


    );
  }
}