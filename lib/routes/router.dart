



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/screen/CalendarWidget.dart';
import 'package:manabees_app_mobile/screen/calendarScreen.dart';
import '../screen/home.dart';
/*import '../screens/login_form.dart';
import '../screens/register_form.dart';
import '../screens/reset_password_form.dart';
 */

Map<String, WidgetBuilder> router = {
  kHomeRoute: (context) =>  const Home(),
  kCalendar: (context) => CalendarScreen(),
  /*kRegisterRoute: (context) => const RegisterForm(),
  kLoginRoute: (context) => LoginForm(),
  kResetPasswordRoute: (context) => const ResetPasswordForm(),*/
};



goHome({formKey, context}) {
  if (formKey.currentState != null &&
      formKey.currentState!.validate()) {
    if (kDebugMode) {
      Navigator.pushNamed(context, kHomeRoute);
    } else {
      if (kDebugMode) {
        print('KO');
      }
    }
  }
}