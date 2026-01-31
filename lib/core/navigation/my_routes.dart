import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_graduation/features/data/models/doctors_model.dart';
import 'package:my_graduation/features/data/models/patient_model.dart';
import 'package:go_router/go_router.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/cubit/add_edit_patient_cubit.dart';
import 'package:my_graduation/features/presentation/add_edit_patient/pages/add_edit_patient.dart';
import 'package:my_graduation/features/presentation/auth/login/pages/login_screen.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_cubit.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/doctor_info_cubit.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/register_cubit.dart';
import 'package:my_graduation/features/presentation/auth/register/pages/doctor_info_screen.dart';
import 'package:my_graduation/features/presentation/auth/register/pages/register_screen.dart';
import 'package:my_graduation/features/presentation/auth/reset_password/pages/reset_password.dart';
import 'package:my_graduation/features/presentation/auth/reset_password/pages/verify_email_for_reset_password.dart';
import 'package:my_graduation/features/presentation/home/pages/home_screen.dart';
import 'package:my_graduation/features/presentation/home/pages/main_screen.dart';
import 'package:my_graduation/features/presentation/home/pages/patients_by_disease_screen.dart';
import 'package:my_graduation/features/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:my_graduation/features/presentation/patient_details/pages/pateint_details.dart';
import 'package:my_graduation/features/presentation/patients/pages/patients_home.dart';
import 'package:my_graduation/features/presentation/profile/pages/edit_profile_screen.dart';
import 'package:my_graduation/features/presentation/profile/pages/profile_screen.dart';
import 'package:my_graduation/features/presentation/q_and_a/pages/q_and_a_screen.dart';
import 'package:my_graduation/features/presentation/search/pages/search_screen.dart';
import 'package:my_graduation/features/presentation/splash/pages/splash_screen.dart';
import 'package:my_graduation/features/presentation/settings/pages/settings_screen.dart';
import 'package:my_graduation/features/presentation/welcome/pages/welcome_screen.dart';

import 'package:my_graduation/features/presentation/settings/pages/about_screen.dart';

class MyRoutes {
  static const String login = '/login';
  static const String main = '/home';
  static const String register = '/register';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String onBoarding = '/onBoarding';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String patientsHome = '/patientsHome';
  static const String patientDetails = '/patientDetails';
  static const String addPatient = '/addPatient';
  static const String settings = '/settings';
  static const String qAndA = '/qAndA';
  static const String about = '/about';
  static const String logout = '/logout';
  static const String notifications = '/notifications';
  static const String resetPassword = '/resetPassword';
  static const String verifyemailForResetPassword =
      '/verifyemailForResetPassword';
  static const String patientsByDisease = '/patientsByDisease';
  static const String doctorInfo = '/doctorInfo';
  static const String editProfile = '/editProfile';

  static final GoRouter routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) {
            return LoginCubit();
          },
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) {
            return RegisterCubit();
          },
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: doctorInfo,
        builder: (context, state) => BlocProvider(
          create: (context) {
            return DoctorInfoCubit();
          },
          child: const DoctorInfoScreen(),
        ),
      ),
      GoRoute(path: main, builder: (context, state) => const MainScreen()),
      GoRoute(path: search, builder: (context, state) => const SearchScreen()),
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: patientsHome,
        builder: (context, state) => const PatientsHome(),
      ),
      GoRoute(
        path: patientDetails,
        builder: (context, state) {
          final model = state.extra as PatientModel?;
          if (model == null) {
            return const PatientsHome();
          }
          return PateintDetails(model: model);
        },
      ),
      //add patient
      GoRoute(
        path: addPatient,
        builder: (context, state) => BlocProvider(
          create: (context) => AddEditPatientCubit(),
          child: AddEditPatient(
            patientModelToedit: state.extra as PatientModel?,
          ),
        ),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(path: qAndA, builder: (context, state) => const QAndAScreen()),

      GoRoute(path: about, builder: (context, state) => const AboutScreen()),
      // GoRoute(
      //   path: logout,
      //   builder: (context, state) => const LogoutScreen(),
      // ),
      // GoRoute(
      //   path: notifications,
      //   builder: (context, state) => const NotificationsScreen(),
      // ),
      GoRoute(
        path: verifyemailForResetPassword,
        builder: (context, state) => const VerifyEmailForResetPassword(),
      ),
      GoRoute(
        path: resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: patientsByDisease,
        builder: (context, state) =>
            PatientsByDiseaseScreen(diseaseName: state.extra as String? ?? ""),
      ),
      GoRoute(
        path: onBoarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) =>
            EditProfileScreen(doctor: state.extra as DoctorsModel),
      ),
    ],
  );
}
