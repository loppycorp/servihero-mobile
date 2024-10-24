import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:herohub_app/2_application/pages/home_page.dart';
import 'package:herohub_app/2_application/pages/login/bloc/login_cubit.dart';
import 'package:herohub_app/core/colors.dart';
import 'package:herohub_app/core/widgets/custom_text_field.dart';
import 'package:herohub_app/core/widgets/gradient_button.dart';
import 'package:herohub_app/core/widgets/loading_modal.dart';
import 'package:herohub_app/injection.dart';

class LoginPageWrapperProvider extends StatelessWidget {
  const LoginPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const name = 'login';
  static const path = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool isEmailValidating = false;
  bool isPasswordValidating = false;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(heroPurple),
        title: Text(
          'Service Hero',
          style: TextStyle(color: Color(heroOrange2)),
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocListener<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is LoginStateLoading) {
            customLoadingModal(context, 'Logging you in...');
          } else if (state is LoginStateError) {
            context.pop();
            const snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text('Incorrect Email or Password'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is LoginStateSuccess) {
            try {
              context
                ..pop()
                ..pushReplacementNamed(HomePage.name);
            } catch (e) {
              context.pushReplacementNamed(HomePage.name);
            }
          }
        },
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(550, 100),
                      bottomRight: Radius.elliptical(500, 100),
                    ),
                    color: Color(heroPurple)),
                constraints: const BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'Login To Your Account',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomTextField(
                            ctrl: emailCtrl,
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  isEmailValidating = true;
                                }
                              });
                            },
                            title: 'Email',
                            isValidating: isEmailValidating,
                            inputType: TextInputType.emailAddress,
                            showTitle: false,
                            textColor: Colors.white,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomTextField(
                            ctrl: passwordCtrl,
                            onChanged: (value) {
                              setState(() {
                                if (value.isEmpty) {
                                  isPasswordValidating = true;
                                }
                              });
                            },
                            title: 'Password',
                            isValidating: isPasswordValidating,
                            inputType: TextInputType.visiblePassword,
                            showTitle: false,
                            textColor: Colors.white,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Remember me',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          GradientButton(
                            onPressed: isSubmitting
                                ? null
                                : () async {
                                    await cubit.login(
                                      emailCtrl.text,
                                      passwordCtrl.text,
                                    );
                                  },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Forgot your password?',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             // Expanded(
                 //child:
                  Expanded(
                    child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffd1d1d1),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xff404040),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Login with Google',
                                      style: TextStyle(color: Color(0xff404040)),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffd1d1d1),
                              elevation: 0,
                            ),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Color(0xff404040),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Login with Facebook',
                                      style: TextStyle(color: Color(0xff404040)),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                                    ),
                                  ),
                  )
              //)
            ],
          ),
        ),
      ),
    );
  }
}
