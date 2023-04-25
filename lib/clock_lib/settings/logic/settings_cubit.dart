import 'package:bloc/bloc.dart';

import '../../storage/storage_base.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._storage) : super(SettingsState()) {
    _readData();
  }

  final StorageBase _storage;

  Future<void> _readData() async {
    emit(
      SettingsState(
        isClockImageNumber: await _storage.getSettingsClockImage(),
        settingsPageChooseImage: await _storage.getSettingsClockImage(),
        selectedLanguage: await _storage.getSelectedLanguage(),
      ),
    );
  }

  void chooseImage(choose) {
    emit(state.copyWith(settingsPageChooseImage: choose));
  }

  Future<void> changeClockImage({required bool isClockImageNumber}) async {
    emit(
      state.copyWith(
        isClockImageNumber: isClockImageNumber,

      ),
    );
    await _storage.setSettingsClockImage(
      isClockImageNumber: isClockImageNumber,
    );
  }
int _imageIndex = 0;  
 String clockImage() {
    if (state.isClockImageNumber!) {
        // ignore: prefer_final_locals
        List<String> imagePaths = ['assets/images/kid4-01-01-01.png', 'assets/images/kid2-01-01.png','assets/images/kid3-01-01.png','assets/images/kid5-01-01.png'];
    // ignore: prefer_final_locals
    String imagePath = imagePaths[_imageIndex % imagePaths.length]; // get the image path based on the current index
    _imageIndex++; // increment the index for the next call
    return imagePath; 
     
     
    } else {
       List<String> imagePaths =['assets/images/kid3-01_sansnum-01-01-01.png','assets/images/kid2-01_sansnum-01-01.png','assets/images/kid3-01_sansnum-01-01.png','assets/images/kid5-01-01_sansnum-01.png'];
        String imagePath = imagePaths[_imageIndex % imagePaths.length]; // get the image path based on the current index
    _imageIndex++; // increment the index for the next call
    return imagePath; 
    }
  }

  Future<void> changeLanguage(String language) async {
    emit(state.copyWith(selectedLanguage: language));
    await _storage.setSelectedLanguage(language: language);
  }
}
