import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../hard_data.dart';
import '../../../routes.dart';
import '../../../style.dart';
import '../../../widget/containers/intubation_checklist_container.dart';
import '../../view_templates/tab_view_template.dart';

class IntubationChecklistPage extends StatelessWidget {
  List<String> getChecklistTitles() {
    return intubationChecklist
        .map(
          (item) => item.title,
        )
        .toList();
  }

  List<Widget> renderBody() {
    return intubationChecklist
        .map((item) => IntubationChecklistContainer(checklist: item.checklist))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabViewTemplate(
      'Intubation Checklist',
      tabs: getChecklistTitles(),
      color: AppColors.green50,
      indicatorColor: AppColors.green900,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/icon/SVG/icon_infographic.svg',
          ),
          onPressed: () => Navigator.pushNamed(
              context, Routes.intubationChecklistInfographic),
        )
      ],
      children: renderBody(),
    );
  }
}