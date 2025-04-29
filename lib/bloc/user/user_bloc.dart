import 'dart:io';
import 'dart:math';
import 'package:fish_caster/api_services/auth_service/auth_service.dart';
import 'package:fish_caster/api_services/user_service/user_service.dart';
import 'package:fish_caster/bloc/share_prefrences/user_shared/user_shared_helper.dart';
import 'package:fish_caster/bloc/token/token_bloc.dart';
import 'package:fish_caster/bloc/token/token_event.dart';
import 'package:fish_caster/bloc/token/token_state.dart';
import 'package:fish_caster/bloc/user/user_event.dart';
import 'package:fish_caster/bloc/user/user_state.dart';
import 'package:fish_caster/model/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserModel? _savedUser; // Store the saved user
  final TokenBloc tokenBloc;
  final BuildContext context;

  UserBloc(this.tokenBloc, this.context) : super(UserInitial()) {
    // Handle SaveUserEvent
    // on<SaveUserEvent>((event, emit) {
    //   _savedUser = event.user; // Store the user in memory
    //   emit(UserLoaded(user: _savedUser!));
    //   print("🎉 User successfully saved in BLoC: ${_savedUser!.email}");
    // });

    on<SaveUserEvent>((event, emit) async {
      print("📦 Saving user: ${event.user?.email}");
      _savedUser = event.user; // Store the user in memory
      emit(UserLoaded(user: _savedUser!));
      print("🎉 User successfully saved in BLoC: ${_savedUser!.email}");
    });

    // // Handle GetUserEvent
    on<GetUserEvent>((event, emit) {
      if (_savedUser != null) {
        emit(UserLoaded(user: _savedUser!)); // Return the saved user
      } else {
        emit(UserError(error: "No user data found"));
        print("📢 No user found in BLoC");
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(UserLoading());

      final prefs = await SharedPreferences.getInstance();
      // final fcToken = await FirebaseApi.getDevicetoken();

      final response = await AuthService.login(
        email: event.email,
        password: event.password,
        // fcmToken: fcToken,
      );

      if (response != null && response.containsKey("user")) {
        final userData = response["user"];
        final tokens = response["tokens"];
        final userProfileData = response["userProfile"];
        final priceId = response["priceId"];

        final user = UserModel(
          id: userData["id"],
          email: userData["email"],
          role: userData["role"],

          isEmailVerified: userData["isEmailVerified"] ?? false,
          name: userData["name"],
        );

        // await saveUserModel(user);
        // emit(UserLoaded(user: user));

        await saveUserModel(user);

        _savedUser = user;
        emit(UserLoaded(user: user));

        tokenBloc.add(
          SaveTokenEvent(tokens["access"]["token"], tokens["refresh"]["token"]),
        );

        await prefs.setString('refreshToken', tokens["refresh"]["token"]);

          emit(UserRedirectToHome());

        // await prefs.setString('fcmToken', fcToken);
      } else {
        emit(
          UserError(error: response?["error"] ?? "Login failed"),
        ); // Use backend error message
      }
    });

    DateTime formatDate(String? dobString) {
      if (dobString == null || dobString.isEmpty) {
        return DateTime.now(); // Default to current date
      }

      try {
        return DateTime.parse(dobString);
      } catch (e) {
        return DateTime.now(); // Handle invalid date formats gracefully
      }
    }

    on<GoogleLoginEvent>((event, emit) async {
      emit(UserLoading());

      final prefs = await SharedPreferences.getInstance();

      final response = await AuthService.googleSignIn(
        idToken: event.token,
        fcmToken: event.fcmToken,
      );

      if (response != null) {
        final userData = response["user"];
        final tokens = response["tokens"];
        final userProfileData =
            response["userProfile"]; // ✅ Correctly fetch userProfile

        // Convert API response to User model
        final user = UserModel(
          id: userData["id"],
          name: userData["name"] ?? "",
          email: userData["email"],
          role: userData["role"],
          isEmailVerified: userData["isEmailVerified"] ?? false,
        );

        // final user = UserModel.fromJson(userData);

        print("🚀 Google User logged in: ${user.email}");

        await saveUserModel(user);

        _savedUser = user;
        emit(UserLoaded(user: user));

        // Store tokens in TokenBloc
        tokenBloc.add(
          SaveTokenEvent(tokens["access"]["token"], tokens["refresh"]["token"]),
        );

        await prefs.setString('refreshToken', tokens["refresh"]["token"]);
          emit(UserRedirectToHome());

        // if (user.profile == null) {
        //   print("🚀 User profile not set, redirecting to setup screen");
        //   emit(UserRedirectToSetup());
        // } else {
        //   print("🚀 User profile found, redirecting to home screen");
        //   emit(UserRedirectToHome());
        // }
      } else {
        emit(UserError(error: "Google login failed"));
      }
    });

    // on<UpdateUserProfileEvent>((event, emit) async {
    //   emit(UserLoading());

    //   final TokenLoaded tokenLoaded = tokenBloc.state as TokenLoaded;
    //   final token = await tokenLoaded.token;

    //   // Assuming you already have the profile image URL (from the upload process)
    //   final updatedUser = await UserService.updateUserProfile(
    //     displayName: event.displayName,
    //     userData: event.userData, // This is your UserProfile object
    //     token: token,
    //     dob: event.dob, // Pass the dob here
    //     profilePicture:
    //         event.profilePicture, // Pass the profile picture URL here
    //   );

    //   print("Updated User in BLoC: $updatedUser");

    //   if (updatedUser != null) {
    //     // Successfully updated profile
    //     _savedUser = updatedUser;
    //     await saveUserModel(updatedUser);

    //     emit(UserLoaded(user: updatedUser)); // Emit the updated user
    //     emit(UserRedirectToHome());
    //   } else {
    //     // If profile update failed
    //     emit(UserError(error: "Profile update failed"));
    //   }
    // });

    on<UpdateProfileEvent>((event, emit) async {
      emit(UserLoading());
      try {
        final updatedUser = await UserService.updateUserProfile(
          token: event.token,
          userId: event.userId,
          name: event.name ?? "",
          // email: event.email ?? "",
         
        );

        if (updatedUser != null) {
          _savedUser = updatedUser; // Store the updated user
          emit(UserLoaded(user: updatedUser)); // Emit the updated user state
          emit(UserRedirectToHome()); // Redirect to home if successful
          await saveUserModel(updatedUser);
        } else {
          if (_savedUser != null) {
            emit(UserLoaded(
                user: _savedUser!)); // Keep the old user if update fails
          } else {
            emit(UserError(
                error: "Profile update failed, and no previous data found"));
          }
          emit(UserRedirectToSetup()); // Redirect if needed
        }
      } catch (e) {
        emit(UserError(error: "Error updating profile: ${e.toString()}"));
      }
    });

    // on<UpdatePriceIdEvent>((event, emit) async {
    //   if (_savedUser != null) {
    //     // Update the priceId in the UserModel
    //     _savedUser = _savedUser!.copyWith(priceId: event.newPriceId);

    //     // Optionally, save the updated user model to SharedPreferences
    //     await saveUserModel(_savedUser!);

    //     // Emit the updated user state
    //     emit(UserLoaded(user: _savedUser!));

    //     // Optionally, redirect or show success message
    //     emit(UserRedirectToHome()); // If you want to redirect to home
    //   } else {
    //     emit(UserError(error: "User not found"));
    //   }
    // });
  }
}
