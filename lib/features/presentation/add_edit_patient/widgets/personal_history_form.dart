import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_graduation/component/my_text_feild.dart';

class PersonalHistoryForm extends StatelessWidget {
  const PersonalHistoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(16),

          MyTextFeild(hint: "Name"),
          Gap(8),

          MyTextFeild(hint: "Age"),
          Gap(8),

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
              Gap(8),
              DropdownButton(
                hint: Text("Marital Status"),

                items: [
                  DropdownMenuItem(value: "Single", child: Text("Single")),
                  DropdownMenuItem(value: "Married", child: Text("Married")),
                ],
                onChanged: (String? value) {},
              ),
              Gap(8),
              Expanded(
                child: MyTextFeild(
                  hint: "Number of Children",
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Gap(8),
          MyTextFeild(hint: "Address"),
          Gap(8),
          MyTextFeild(hint: "Occupation"),
          Gap(8),
          DropdownButton(
            hint: Text("Smoking Status"),

            items: [
              DropdownMenuItem(value: "Non Smoker", child: Text("Non Smoker")),
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
          Gap(8),
          SizedBox(height: 20),
          Gap(8),
          ElevatedButton(
            onPressed: () {
              // Save patient information
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
