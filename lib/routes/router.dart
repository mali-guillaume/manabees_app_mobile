



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:manabees_app_mobile/routes/routes.dart';
import 'package:manabees_app_mobile/screen/CalendarWidget.dart';
import 'package:manabees_app_mobile/screen/Home.dart';
import 'package:manabees_app_mobile/screen/RucheScreen.dart';
import 'package:manabees_app_mobile/screen/calendarScreen.dart';
import 'package:manabees_app_mobile/screen/register_form.dart';
import 'package:path/path.dart';
import '../screen/home.dart';
import '../screen/login_form.dart';
/*import '../screens/login_form.dart';
import '../screens/register_form.dart';
import '../screens/reset_password_form.dart';
 */




/// Une carte des itinéraires.
Map<String, WidgetBuilder> router = {
  kHomeRoute: (context) =>  const Home(),
  kCalendar: (context) => CalendarScreen(),
  kRegisterRoute: (context) =>  SignupPage(),
  kLoginRoute: (context) => LoginForm(),
  kHOMERoute : (context) => Index(),
  kRucheRoute : (context) => RucheScreen(),
  //kRucherRoute
  //kResetPasswordRoute: (context) => const ResetPasswordForm(),
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