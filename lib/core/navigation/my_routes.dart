import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_graduation/features/presentation/auth/login/pages/login_screen.dart';
import 'package:my_graduation/features/presentation/auth/login/cubit/login_cubit.dart';
import 'package:my_graduation/features/presentation/auth/register/cubit/register_cubit.dart';
import 'package:my_graduation/features/presentation/auth/register/pages/register_screen.dart';
import 'package:my_graduation/features/presentation/home/pages/home_screen.dart';
import 'package:my_graduation/features/presentation/home/pages/main_screen.dart';
import 'package:my_graduation/features/presentation/patient_details/pages/pateint_details.dart';
import 'package:my_graduation/features/presentation/patients/pages/patients_home.dart';
import 'package:my_graduation/features/presentation/splash/pages/splash_screen.dart';

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
      GoRoute(path: main, builder: (context, state) => const MainScreen()),
      GoRoute(path: home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: patientsHome,
        builder: (context, state) => const PatientsHome(),
      ),
      GoRoute(
        path: patientDetails,
        builder: (context, state) => const PateintDetails(),
      ),
    ],
  );
}
