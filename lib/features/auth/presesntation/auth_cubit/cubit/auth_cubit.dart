import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/features/auth/presesntation/auth_cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? termsAndConditionCheck = false;
  final GlobalKey<FormState> signInKey = GlobalKey();
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  final GlobalKey<FormState> signUpKey = GlobalKey();
  Future<void>createUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserProfile();
      await verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpErrorState(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpErrorState(
            error: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SignUpErrorState(error: 'the email is invalid'));
      }
    } catch (e) {
      emit(SignUpErrorState(error: e.toString()));
    }
  }

  Future<void>updateTermsAndConditionCheck({required newValue}) async{
    termsAndConditionCheck = newValue;
    emit(TermsAndConditionUpdateState());
  }

 Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!, password: password!);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(error: "Check your email and password"));
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      emit(SignInErrorState(error: e.toString()));
    }
  }

 Future<void> verifyEmail() async{
   await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void>resetPassword() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordErrorState(error: e.toString()));
    }
  }

  Future<void>addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    await users.add({
      "firstName": firstName,
      "lastName": lastName,
      "email": emailAddress,
    });
  }
}
