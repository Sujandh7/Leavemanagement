import 'package:flutter/material.dart';
import 'allowance.dart';

class CreateLeavePage extends StatefulWidget {
  final Allowance service; // Service object for any backend operations

  const CreateLeavePage({Key? key, required this.service}) : super(key: key);

  @override
  State<CreateLeavePage> createState() => _CreateLeavePageState();
}

class _CreateLeavePageState extends State<CreateLeavePage> {
  final List<String> leaveTypes = ['Paid Annual Leave', 'Unpaid Annual Leave', 'Sick Leave'];
  String? _selectedLeaveType;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Leave')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Staff's name",
              ),
            ),
            SizedBox(height: 10),
            TextField(keyboardType: TextInputType.number,
              controller: _durationController,
              decoration: InputDecoration(
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Duration of leave",
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              hint: Text("Select leave type"),
              items: leaveTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLeaveType = newValue;
                });
              },
              value: _selectedLeaveType,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                String staffName = _nameController.text;
                String leaveDuration = _durationController.text;

                if (staffName.isNotEmpty && leaveDuration.isNotEmpty && _selectedLeaveType != null) {
                  widget.service.leaves[staffName] = "Duration: $leaveDuration, Type: $_selectedLeaveType";

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Leave Created'),
                        content: Text('Leave has been created for $staffName with a duration of $leaveDuration days as $_selectedLeaveType.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please fill in all fields.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Create Leave'),
            ),
          ],
        ),
      ),
    );
  }
}
