import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tasks/core/utils/sizing_utils.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_option_item.dart';
import '../../../../core/constants/app_constants.dart';

@RoutePage()
class NewUserSearchScreen extends ConsumerWidget {
  const NewUserSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final options = AppConstants.searchOptions;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizingUtils.dynamicWidth(0.04, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarWidget(
                controller: searchController,
               onCancel: context.pop,
                onClear: () => searchController.clear(),
              ),
              SizedBox(height: SizingUtils.dynamicHeight(0.02, context)),

              Text(
                "Search for",
                style: GoogleFonts.poppins(
                  fontSize: SizingUtils.dynamicFont(0.02, context),
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: SizingUtils.dynamicHeight(0.015, context)),

              Expanded(
                child: Column(
                  children: [
                    // First row - Home Finance, Instant Finance
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: SizingUtils.dynamicWidth(0.015, context),
                              bottom: SizingUtils.dynamicHeight(0.015, context),
                            ),
                            child: SearchOptionItem(
                              option: options[0],
                              onTap: () {
                                // Handle Home Finance tap
                                print('Home Finance');
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: SizingUtils.dynamicHeight(0.015, context),
                            ),
                            child: SearchOptionItem(
                              option: options[1],
                              onTap: () {
                                // Handle Instant Finance tap
                                print('Instant Finance ');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    // Second row - Advance Salary
                    Row(
                      children: [
                        Expanded(
                          child: SearchOptionItem(
                            option: options[2],
                            onTap: () {
                              // Handle Advance Salary tap
                              print('Advance Salary');
                            },
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}