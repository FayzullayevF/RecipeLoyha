import 'package:chef_staff/data/repository/auth_repository.dart';
import 'package:chef_staff/authentication/presentation/manager/sign_up_view_model.dart';
import 'package:chef_staff/authentication/presentation/widgets/page_text.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_date_of_birth_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_password_form_field.dart';
import 'package:chef_staff/authentication/presentation/widgets/recipe_text_form_field.dart';
import 'package:chef_staff/core/client.dart';
import 'package:chef_staff/core/l10n/app_localizations.dart';
import 'package:chef_staff/core/presentations/localization_view_model.dart';
import 'package:chef_staff/core/presentations/recipe_eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/sizes.dart';
import '../../../core/utils/utils.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) =>
          SignUpViewModel(authRepo: AuthRepository(client: ApiClient())),
      builder: (context, index) {
        final vm = context.read<SignUpViewModel>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.signUp,
              style: TextStyle(
                color: AppColors.nameColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  context.read<LocalizationViewModel>().currentLocale = Locale("uz");
                },
                child:  Text("uz")),
              TextButton(onPressed: () {
                context.read<LocalizationViewModel>().currentLocale = Locale("ru");
              }, child: Text("ru")),
              TextButton(onPressed: () {
                context.read<LocalizationViewModel>().currentLocale = Locale("en");
              }, child: Text("en ")),

            ],
          ),
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
              children: [
                Form(
                  key: vm.formKey,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      RecipeTextFormField(
                          hintText: AppLocalizations.of(context)!.firstName,
                          validator: (value) => null,
                          controller: vm.firstNameController,
                          title: AppLocalizations.of(context)!.firstName,
                ),
                      RecipeTextFormField(
                          hintText: AppLocalizations.of(context)!.lastName,
                          validator: (value) => null,
                          controller: vm.lastNameController,
                          title: AppLocalizations.of(context)!.lastName),
                      RecipeTextFormField(
                          hintText: AppLocalizations.of(context)!.username,
                          validator: (value) => null,
                          controller: vm.userNameContorller,
                          title: AppLocalizations.of(context)!.username),
                      RecipeTextFormField(
                          hintText: "example@gmail.com",
                          validator: (value) => null,
                          controller: vm.emailController,
                          title: AppLocalizations.of(context)!.email),
                      RecipeTextFormField(
                          hintText: "+123 456 789",
                          validator: (value) => null,
                          controller: vm.phoneNumberController,
                          title: AppLocalizations.of(context)!.mobileNumber),
                      RecipeDateOfBirthField(),
                      RecipePasswordFormField(
                        controller: vm.passwordController,
                        title: AppLocalizations.of(context)!.password,
                        validator: (value) => null,
                      ),
                      RecipePasswordFormField(
                        controller: vm.confirmPasswordController,
                        title: AppLocalizations.of(context)!.confirmPassword,
                        validator: (value) {
                          if (vm.passwordController.text !=
                              vm.confirmPasswordController.text) {
                            return "Password do not match";
                          } else {
                            return null;
                          }
                        },
                      ),
                      PageText(
                          title: AppLocalizations.of(context)!.signUpDesc,
                          size: 14,
                          weight: 400),
                      PageText(
                          title: AppLocalizations.of(context)!.signUpTerms,
                          size: 14,
                          weight: 600),
                      RecipeElevatedButton(
                        fontSize: 16,
                          text: AppLocalizations.of(context)!.signUp,
                          callback: () async {
                            context
                                .read<SignUpViewModel>()
                                .formKey
                                .currentState!
                                .validate();
                            if (await vm.signUp() && context.mounted) {
                              showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                          child: Container(
                                        height: 286,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Sign Up Succesfully!",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )));
                            }
                          }),
                      PageText(
                          title: AppLocalizations.of(context)!.signUpAlready,
                          size: 13,
                          weight: 300),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ]),
        );
      },
    );
  }
}
