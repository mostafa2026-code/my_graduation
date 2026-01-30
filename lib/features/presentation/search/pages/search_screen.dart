import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/core/enums/my_enums.dart';
import 'package:my_graduation/core/functions/my_future_builder.dart';
import 'package:my_graduation/core/lists/diseases_list.dart';
import 'package:my_graduation/core/navigation/navigation_methods.dart';
import 'package:my_graduation/features/presentation/search/cubit/search_cubit.dart';
import 'package:my_graduation/features/presentation/search/cubit/search_states.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().resetSearch();
    context.read<SearchCubit>().getallpatient();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.watch<SearchCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                        controller: searchCubit.searchController,
                        decoration: InputDecoration(
                          hintText: "Search by name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: const Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          searchCubit.onSearchChanged();
                        },
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
                                      searchCubit.selectedDisease ??
                                          "Select Disease",
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
                                        searchCubit.selectedDisease = value;
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
                          value: searchCubit.sortBy == SortBy.name.name,
                          onChanged: (value) {
                            if (value == true) {
                              searchCubit.sortBy = SortBy.name.name;
                            } else {
                              searchCubit.sortBy = null;
                            }

                            searchCubit.searchPatients();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Age"),
                        Checkbox.adaptive(
                          value: searchCubit.sortBy == SortBy.age.name,
                          onChanged: (value) {
                            if (value == true) {
                              searchCubit.sortBy = SortBy.age.name;
                            } else {
                              searchCubit.sortBy = null;
                            }

                            searchCubit.searchPatients();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Latest Date"),
                        Checkbox.adaptive(
                          value: searchCubit.sortBy == SortBy.latestDay.name,
                          onChanged: (value) {
                            if (value == true) {
                              searchCubit.sortBy = SortBy.latestDay.name;
                            } else {
                              searchCubit.sortBy = null;
                            }
                            searchCubit.searchPatients();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Oldest Date"),
                        Checkbox.adaptive(
                          value: searchCubit.sortBy == SortBy.oldestDay.name,
                          onChanged: (value) {
                            if (value == true) {
                              searchCubit.sortBy = SortBy.oldestDay.name;
                            } else {
                              searchCubit.sortBy = null;
                            }
                            searchCubit.searchPatients();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                BlocBuilder<SearchCubit, SearchStates>(
                  builder: (context, state) {
                    if (state is SearchError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is SearchSuccess) {
                      return myStreamBuilder(stream: state.result);
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
