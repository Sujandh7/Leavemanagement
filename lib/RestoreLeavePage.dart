import 'package:flutter/material.dart';
import 'package:flutter_application_1/allowance.dart';

class RestoreLeavePage extends StatefulWidget {
  const RestoreLeavePage({super.key, required this.service});
  final Allowance service;

  @override
  State<RestoreLeavePage> createState() => _RestoreLeavePageState();
}

class _RestoreLeavePageState extends State<RestoreLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restore"),
      ),
      body: widget.service.deletedLeaves.isEmpty
          ? Center(child: Text('No deleted leaves to restore'))
          : ListView(
              children: widget.service.deletedLeaves.map((leave) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: leave.entries.map((entry) {
                    return ListTile(
                      title: Text('Staff: ${entry.key}'),
                      subtitle: Text(entry.value),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.service.leaves[entry.key] = entry.value;
                            widget.service.deletedLeaves.remove(leave);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Leave for ${entry.key} has been restored.'),
                            ),
                          );
                        },
                        child: Text('Restore'),
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }
}
