import 'package:flutter/material.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class AddEditPatient extends StatelessWidget {
  const AddEditPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Patient')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFeild(hint: "Name"),
              MyTextFeild(hint: "Age"),
              Row(
                children: [
                  DropdownButton(
                    hint: Text("Gender"),

                    items: [
                      DropdownMenuItem(value: "Male", child: Text("Male")),
                      DropdownMenuItem(value: "Female", child: Text("Female")),
                    ],
                    onChanged: (String? value) {},
                  ),
                  DropdownButton(
                    hint: Text("Marital Status"),

                    items: [
                      DropdownMenuItem(value: "Single", child: Text("Single")),
                      DropdownMenuItem(
                        value: "Married",
                        child: Text("Married"),
                      ),
                    ],
                    onChanged: (String? value) {},
                  ),
                  Expanded(
                    child: MyTextFeild(
                      hint: "Number of Children",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              MyTextFeild(hint: "Address" ,),
              MyTextFeild(hint: "Occupation"),
              DropdownButton(
                hint: Text("Smoking Status"),

                items: [
                  DropdownMenuItem(
                    value: "Non Smoker",
                    child: Text("Non Smoker"),
                  ),
                  DropdownMenuItem(
                    value: "Light Smoker",
                    child: Text("Light Smoker"),
                  ),

                  DropdownMenuItem(
                    value: "Heavy Smoker",
                    child: Text("Heavy Smoker"),
                  ),
                ],
                onChanged: (String? value) {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Save patient information
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
