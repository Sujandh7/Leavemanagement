import 'package:flutter/material.dart';

class ActiveLeavePage extends StatelessWidget {
    final Map<String, String> leaves; 

  const ActiveLeavePage({super.key,required this.leaves});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Active Leave Details')),
      body: leaves.isEmpty
          ? Center(child: Text('No active leaves are currently stored.'))
          : ListView(
              children: leaves.entries
                  .map((entry) => ListTile(
                        title: Text('Staff: ${entry.key}'),
                        subtitle: Text(entry.value),
                      )).toList()
                  
            ),
    );
  }
}


