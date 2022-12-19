import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_talk/common/app_colors.dart';
import 'package:uni_talk/core/exceptions.dart';
import 'package:uni_talk/features/login/domain/entities/faculty.dart';
import 'package:uni_talk/features/login/domain/entities/university.dart';
import 'package:uni_talk/features/login/domain/entities/user.dart';
import 'package:uni_talk/features/login/domain/use_cases/register.dart';
import 'package:uni_talk/features/login/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:uni_talk/features/login/presentation/bloc/register_bloc/register_event.dart';
import 'package:uni_talk/features/login/presentation/bloc/register_bloc/register_state.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_password_field.dart';
import 'package:uni_talk/features/login/presentation/widgets/modern_text_field.dart';
import 'package:uni_talk/features/login/presentation/widgets/next_button.dart';

import '../../../../locator_service.dart';

class RegistrationPage extends StatefulWidget {
  final bool showLeading;

  const RegistrationPage({Key? key, required this.showLeading})
      : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  void _signUpButton(BuildContext context) {
    var bloc = context.read<RegisterBloc>();
    var name = _firstNameController.value.text;
    var surname = _lastNameController.value.text;
    var username = _usernameController.value.text;
    var password = _passwordController.value.text;
    var student = Student(
        name: name,
        password: password,
        surname: surname,
        username: username,
        university_name: "Unec",
        university_id: "1",
        language: "ru",
        faculty_name: "Dizayn",
        faculty_id: "1");
    bloc.add(RegisterRequestedEvent(student: student));
  }

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Если перейти назад.
      },
      child: Scaffold(
        backgroundColor: AppColors.blackBackground,
        appBar: AppBar(
          backgroundColor: AppColors.blackBackground,
          title: Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width / 20.8333333333,
            ),
          ),
          centerTitle: true,
          leading: widget.showLeading
              ? const Icon(Icons.arrow_back_ios_rounded)
              : null,
        ),
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is UserExistsError) {
              //TODO показать диалог
            } else if (state is RegisterError) {}
          },
          builder: (context, state) {
            if (state is RegisterStarted) {
              // TODO основной экран
            } else if (state is RegisterLoading) {
              // TODO экран загрузки
            }
            return WillPopScope(
              onWillPop: () async {
                return true;
              },
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "Complete your account",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width /
                                      15.625,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Text(
                                "Lorem ipsum dolor sit amet",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width /
                                      26.7857142857,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Column(
                          children: [
                            ModernTextField(
                                textEditingController: _firstNameController,
                                labelTitle: 'First Name',
                                hint: 'Enter your first name'),
                            const Padding(padding: EdgeInsets.all(10)),
                            ModernTextField(
                                textEditingController: _lastNameController,
                                labelTitle: 'Last Name',
                                hint: 'Enter your last name'),
                            const Padding(padding: EdgeInsets.all(10)),
                            ModernTextField(
                                textEditingController: _usernameController,
                                labelTitle: 'Username',
                                hint: 'Enter your username'),
                            const Padding(padding: EdgeInsets.all(10)),
                            ModernPasswordField(
                              textEditingController: _passwordController,
                              labelTitle: 'Password',
                              hint: 'Enter your password',
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            ModernPasswordField(
                              textEditingController: _confirmPasswordController,
                              labelTitle: 'Confirm Password',
                              hint: 'Confirm password',
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            Row(
                              children: [
                                Expanded(
                                    child: NextButton(
                                        onPressed: () {
                                          _signUpButton(context);
                                        },
                                        title: 'Sign Up')),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkOrange),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}
