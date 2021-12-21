import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateToView extends StatelessWidget {
  CreateToView({Key? key}) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('Create ToDo'),
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xfff0f4ff),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'please enter title',
                  border: UnderlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title is required';
                  }
                },
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'please enter title',
                  labelStyle: TextStyle(
                    color: Color(0xff203306C),
                  ),
                  border: UnderlineInputBorder(borderSide: BorderSide()),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Description is required';
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: dateController,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        ).then((selectedDate) {
                          final DateFormat dateFormat =
                              DateFormat('dd/MM/yyyy');
                          dateController.text =
                              dateFormat.format(selectedDate!);
                        });
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Date",
                        hintText: 'please enter date',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date is required';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: timeController,
                      maxLines: 1,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (selectedTime) {
                            timeController.text = selectedTime!.format(context);
                          },
                        );
                      },
                      decoration: InputDecoration(
                        labelText: "Time",
                        hintText: "please enter date",
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time is required';
                        }
                      },
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print('success');
                    print(titleController.text);
                    print(descriptionController.text);
                    print(dateController.text);
                    print(timeController.text);
                  } else {
                    print('failed');
                  }
                },
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
