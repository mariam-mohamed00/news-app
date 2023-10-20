// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../my_theme.dart';
// import '../providers/app_config_provider.dart';
// import 'language_bottom_sheet.dart';
//
// class SettingsTab extends StatefulWidget {
//   @override
//   State<SettingsTab> createState() => _SettingsTabState();
// }
//
// class _SettingsTabState extends State<SettingsTab> {
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<AppConfigProvider>(context);
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(AppLocalizations.of(context)!.language,
//                 style: Theme.of(context).textTheme.titleSmall),
//             InkWell(
//               onTap: () {
//                 LanguageBottommSheet();
//                 setState(() {});
//               },
//               child: Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: MyTheme.whiteColor,
//                       border:
//                       Border.all(color: MyTheme.primaryLight, width: 2)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           provider.appLanguage == 'en'
//                               ? AppLocalizations.of(context)!.english
//                               : AppLocalizations.of(context)!.arabic,
//                           style: TextStyle(
//                               fontSize: 14, color: MyTheme.primaryLight),
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_drop_down,
//                         color: MyTheme.primaryLight,
//                       )
//                     ],
//                   )),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               AppLocalizations.of(context)!.mode,
//               style: provider.appTheme == ThemeMode.light
//                   ? Theme.of(context).textTheme.titleSmall
//                   : Theme.of(context)
//                   .textTheme
//                   .titleSmall!
//                   .copyWith(color: MyTheme.whiteColor),
//             ),
//             InkWell(
//               onTap: () {
//                 showThemeBottomSheet();
//                 setState(() {});
//               },
//               child: Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color :MyTheme.whiteColor,
//                       border:
//                       Border.all(color: MyTheme.primaryLight, width: 2)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                                AppLocalizations.of(context)!.light_mode,
//                           style: TextStyle(
//                               fontSize: 14, color: MyTheme.primaryLight),
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_drop_down,
//                         color: MyTheme.primaryLight,
//                       )
//                     ],
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showLanguageBottomSheet() {
//     showModalBottomSheet(
//         context: context, builder: (context) => LanguageBottommSheet());
//   }
//
//   void showThemeBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => LanguageBottommSheet(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';
import 'package:news/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset('assets/images/background.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover)),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Language',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.blackColor)),
                  ),
                  InkWell(
                    onTap: () {
                      showLanguageBottomSheet();
                      setState(() {});
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: MyTheme.whiteColor,
                            border: Border.all(
                                color: MyTheme.primaryLight, width: 3)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                provider.appLanguage == 'en'
                                    ? 'English'
                                    : 'Arabic',
                                style: TextStyle(
                                    fontSize: 14, color: MyTheme.primaryLight),
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: MyTheme.primaryLight,
                            )
                          ],
                        )),
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottommSheet());
  }
}
