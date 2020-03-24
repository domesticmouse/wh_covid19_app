import 'package:flutter/material.dart';
import 'package:wh_covid19/routes.dart';
import 'package:wh_covid19/style.dart';
import 'package:wh_covid19/view/home_page.dart';
import 'package:wh_covid19/view/info_view.dart';
import 'package:wh_covid19/view/intubation/algorithm/intubation_algorithm_page.dart';
import 'package:wh_covid19/view/intubation/checklist/intubation_checklist_page.dart';
import 'package:wh_covid19/view/intubation/guidance/intubation_guidance_page.dart';
import 'package:wh_covid19/view/ppe/ppe_view.dart';
import 'package:wh_covid19/view/sbs_guide_view.dart';
import 'package:wh_covid19/view/staff_welfare/your_welfare_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EGBA',
      theme: ThemeData(
        primaryColor: Colors.green,
        backgroundColor: AppColors.appBackground,
        fontFamily: 'Inter',
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.ppe: (context) => PPEView(),
        Routes.staffWelfare: (context) => YourWelfareView(),
        Routes.sbsGuidance: (context) => SBSGuideView(),
      },
      onGenerateRoute: (settings) {
        // Use onGenerateRoute to set fullscreenDialog=true
        switch (settings.name) {
          case Routes.info:
            return MaterialPageRoute<InfoView>(
              builder: (context) => InfoView(),
              fullscreenDialog: true,
            );
          case Routes.intubationGuidance:
            return MaterialPageRoute<IntubationGuidancePage>(
              builder: (context) => IntubationGuidancePage(),
              fullscreenDialog: false,
            );
          case Routes.intubationAlgorithm:
            return MaterialPageRoute<IntubationAlgorithmPage>(
              builder: (context) => IntubationAlgorithmPage(),
              fullscreenDialog: false,
            );
          case Routes.intubationChecklist:
            return MaterialPageRoute<IntubationChecklistPage>(
              builder: (context) => IntubationChecklistPage(),
              fullscreenDialog: false,
            );
        }
        // Fallback, won't be called unless an unknown route is called
        return MaterialPageRoute<HomePage>(
          builder: (context) => HomePage(),
          fullscreenDialog: true,
        );
      },
    );
  }
}
