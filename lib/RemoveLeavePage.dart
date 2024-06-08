import 'package:flutter/material.dart';
import 'package:flutter_application_1/allowance.dart';

class RemoveLeavePage extends StatefulWidget {
  const RemoveLeavePage({super.key, required this.service});
  final Allowance service;

  @override
  State<RemoveLeavePage> createState() => _RemoveLeavePageState();
}

class _RemoveLeavePageState extends State<RemoveLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Active Leave Details')),
      body: widget.service.leaves.isEmpty
          ? Center(child: Text('No active leaves are currently stored.'))
          : ListView(
              children: widget.service.leaves.entries
                  .map((entry) => ListTile(
                        title: Text('Staff: ${entry.key}'),
                        subtitle: Text(entry.value),
                        trailing:IconButton(icon: Icon(Icons.delete),onPressed: () {

                          setState(() {
                            
                          
                          widget.service.deletedLeaves.add({entry.key:entry.value});
                          //for removing
                          widget.service.leaves.remove(entry.key);
                          });
                        },),
                      ))
                  .toList(),
            ),
    );
  }
}
