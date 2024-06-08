import 'package:flutter/material.dart';
import 'package:travel_link/src/common_widgets/auto_complete_search.dart';
import 'package:travel_link/src/common_widgets/curved_edges.dart';
import 'package:travel_link/src/utils/constants/colors.dart';

class CurvedSearchContainer extends StatelessWidget {

  const CurvedSearchContainer({required this.controller, super.key});
  final DestinationController controller;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: CustomColors.primary.withOpacity(0.7),
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: 160,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -120,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                right: -170,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: AutoCompleteSearch(
                    controller: controller,
                    horizontalPadding: 95,
                    filterByType: 'amenity',
                    textFieldDecoration: InputDecoration(
                      hintText: 'Activity...',
                      fillColor: CustomColors.white,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          color: CustomColors.white,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        color: CustomColors.primary,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: CustomColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
