import 'package:flutter/material.dart';
import 'package:provider_counter/resources/color.dart';

class RoundButon extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;


  const RoundButon({super.key, required this.title, this.loading=false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(color: AppColors.greencolor,
        borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child:loading?CircleAvatar(): Text('Continue'),),
      ),
    );
  }
}
