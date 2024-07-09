import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/pages/profile/view/profile_screen.dart';
import 'package:landlord/utils/custom_image_picker_dialog.dart';
import 'package:landlord/utils/dialog/loading_dialog.dart';
import 'package:landlord/utils/global_state.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart' as dio;

class EditProfileProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneNumController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  String? profileImage;
  File? imagePath;

  EditProfileProvider(context) {
    setData(context);
  }

  Future<dynamic> pickImage(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogImagePicker(
          onCameraClick: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
                source: ImageSource.camera,
                maxHeight: 300,
                maxWidth: 300,
                imageQuality: 90);
            imagePath = File(image!.path);

            if (kDebugMode) {
              print(File(image.path));
            }
          },
          onGalleryClick: () async {
            final ImagePicker pickerGallery = ImagePicker();
            final XFile? imageGallery = await pickerGallery.pickImage(
                source: ImageSource.gallery,
                maxHeight: 300,
                maxWidth: 300,
                imageQuality: 90);
            imagePath = File(imageGallery!.path);
            if (kDebugMode) {
              print(File(imageGallery.path));
            }
          },
        );
      },
    );
  }

  setData(context) {
    final provider = Provider.of<LocalAuthProvider>(context, listen: false);
    final user = provider.getUser();
    nameController.text = user!.name!;
    phoneNumController.text = user.phone!;
    emailController.text = user.email!;
    addressController.text = user.address!;
  }

  void editProfile({required BuildContext context}) async {
    final data = {
      "name": nameController.text,
      "phone": phoneNumController.text,
      "email": emailController.text,
      "address": addressController.text,
      "avatar": imagePath?.path != null
          ? await dio.MultipartFile.fromFile(imagePath?.path ?? '',
              filename: imagePath?.path

              // imagePath?.path ?? editProfileRespnse?.data?.user?.avatar ?? '',
              )
          : null
    };
    RepositoryImpl(context).editProfileApi(data).then((user) {
      if (user != null) {
        LoadingDialog.showToastNotification(
          "Profile updated successfully",
        );
        context.read<LocalAuthProvider>().updateUser(
            user.copyWith(token: GlobalState.instance.get('token')));
        NavUtil.pushAndRemoveUntil(context, const ProfileScreen());
      }
    });
  }
}
