import 'package:bloc/bloc.dart';
import 'package:egy_travel/model/Profile/get_profile_response.dart';
import 'package:egy_travel/repositories/get_profile_repo.dart';
import 'package:egy_travel/view_model/UserDataCubit/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void getProfile() async {
    emit(const ProfileState.profileloading());
    final response = await _profileRepo.getProfile();
    response.when(
        success: (GetProfileResponseModel getProfileResponseModel) async {
      emit(ProfileState.profileSuccess(getProfileResponseModel));
    }, failure: (errorHandler) {
      emit(ProfileState.profileError(errorHandler));
    });
  }
}
