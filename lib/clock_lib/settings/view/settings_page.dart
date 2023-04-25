import 'package:e_learning_app/math_lib/utils/colorConst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/l10n.dart';
import '../../settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _language;

  @override
  void initState() {
    final settingsCubit = context.read<SettingsCubit>();
    _language = settingsCubit.state.selectedLanguage ?? 'en';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settingsCubit = context.watch<SettingsCubit>();
    final bool isClockImageNumber =
        settingsCubit.state.settingsPageChooseImage ?? true;

    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 600,
        width: 1024,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: baseColorLight,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
                settingsCubit
                    .chooseImage(settingsCubit.state.isClockImageNumber);
              },
            ),
            title: Text(l10n.settingsPageTitle),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
               Text(
                l10n.settingsPageChooseClock,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: baseColor,
                ),
               ),
                const SizedBox(
                height: 10,
              ),
              Text(
                l10n.settingsPageNumberedOrUnnumbered,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kpink,
                ),
              ),
 const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  chooseImage(
                    onTap: () {
                      settingsCubit.chooseImage(true);
                    },
                    color: isClockImageNumber ? baseColorLight : Colors.grey,
                    image: 'assets/images/kid3-01-01.png',
                  ),
                  chooseImage(
                    onTap: () {
                      settingsCubit.chooseImage(false);
                    },
                    color: isClockImageNumber ? Colors.grey : baseColorLight,
                    image: 'assets/images/kid5-01-01_sansnum-01.png',
                  ),
                ],
              ),
              Row(
                
                children: [
                  
                  const Expanded(child: SizedBox(height: 100)),

                  languageRadioListTile(l10n.settingsPageEnglish, 'en'),
                  const Expanded(child: SizedBox(height: 100)),
                  languageRadioListTile(l10n.settingsPageTurkish, 'tr'),
                  const Expanded(child: SizedBox(height: 100)),
                ],
              ),
              ElevatedButton(
                 style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(baseColor), // Set the button color
                 ),
                onPressed: () {
                  settingsCubit.changeClockImage(
                    isClockImageNumber: isClockImageNumber,
                  );
                  settingsCubit.changeLanguage(_language!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      
                      content: Text(
                        l10n.settingsPageSnackBarSaved,
                        style: const TextStyle(
                          fontSize: 30,
                        color: Colors.white,
                        
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(milliseconds: 1500),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      width: 300,
                    ),
                  );
                },
                
                child: Text(l10n.settingsPageChangeButton,style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell chooseImage({
    required VoidCallback onTap,
    required Color color,
    required String image,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color ,
            width: 6.0,
          ),
        ),
        height: 200,
        width: 200,
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }

  Widget languageRadioListTile(l10n, String lang) {
    return Expanded(
      
      child: SizedBox(
       
        
        child: RadioListTile<String>(
          title: Text(l10n),
          
          activeColor: baseColor,
          value: lang,
          groupValue: _language,
          onChanged: (value) {
            setState(() {
              _language = value;
            });
          },
        ),
      ),
    );
  }
}
