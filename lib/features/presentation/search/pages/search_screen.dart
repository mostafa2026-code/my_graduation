import 'package:flutter/material.dart';
import 'package:my_graduation/core/lists/diseases_list.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedDisease;

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
                              title: Text("Filter"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
