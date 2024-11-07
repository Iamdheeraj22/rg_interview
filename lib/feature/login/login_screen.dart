import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rg_interview/core/res/strings/app_heading.dart';
import 'package:rg_interview/feature/dashboard/dashboad_screen.dart';
import 'package:rg_interview/feature/login/bloc/login_bloc.dart';
import 'package:rg_interview/widgets/google_button.dart';
import 'package:rg_interview/widgets/state_loading_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, DashboardPage.id, (route) => false);
          return;
        }
      },
      builder: (context, state) {
        return StateLoadingView(
          isLoading: (state.status == LoginStatus.login ||
              state.status == LoginStatus.loginWithGoogle),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text(
                AppHeading.hLogin,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  GoogleButton(
                    onTap: () {
                      context.read<LoginBloc>().add(LoginWithGoogle());
                    },
                    title: AppHeading.hLoginWithGoogle,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
