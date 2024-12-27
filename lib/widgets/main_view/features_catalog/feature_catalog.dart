import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalamullah/widgets/navigation_widget.dart';
import 'package:kalamullah/widgets/main_view/features_catalog/reuseable_expanded_widget.dart';
import 'package:kalamullah/views/features/quran_view.dart';
import 'package:kalamullah/views/features/prayers_view.dart';

class FeatureCatalog extends StatelessWidget {
  const FeatureCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Row(
        children: [
          ReusableExpandedWidget(
            txt: "Quran",
            icon: FontAwesomeIcons.bookOpen,
            onTap: () {
              navigationWidget(context, const QuranView());
            },
          ),
          const SizedBox(width: 10),
          ReusableExpandedWidget(
            txt: "Prayers",
            icon: FontAwesomeIcons.handsPraying,
            onTap: () {
              navigationWidget(context, const PrayersView());
            },
          ),
        ],
      ),
    );
  }
}
