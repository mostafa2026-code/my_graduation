import 'package:flutter/material.dart';
import 'package:my_graduation/core/functions/my_future_builder.dart';
import 'package:my_graduation/core/lists/diseases_list.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/core/services/firebsase/firestore_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedDisease;
  String? sortBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: "Search by name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Filter By Disease"),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownButtonFormField(
                                    hint: Text(
                                      selectedDisease ?? "Select Disease",
                                    ),
                                    items: diseasesList
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDisease = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    mypop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    mypop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.filter_alt),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sort By"),
                    Row(
                      children: [
                        Text("Name"),
                        Checkbox.adaptive(
                          value: sortBy == "name",
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                sortBy = "name";
                              } else {
                                sortBy = null;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Age"),
                        Checkbox.adaptive(
                          value: sortBy == "age",
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                sortBy = "age";
                              } else {
                                sortBy = null;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Latest Date"),
                        Checkbox.adaptive(
                          value: sortBy == "Latest Date",
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                sortBy = "Latest Date";
                              } else {
                                sortBy = null;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Oldest Date"),
                        Checkbox.adaptive(
                          value: sortBy == "Oldest Date",
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                sortBy = "Oldest Date";
                              } else {
                                sortBy = null;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                myFutureBuilder(future: FirestoreHelper.getAllPatient()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
