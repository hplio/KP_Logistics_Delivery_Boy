import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:la_logistics/backend_files/docket_delivery_details.dart';
import 'package:la_logistics/backend_files/get_docket_by_id.dart';
import 'package:la_logistics/backend_files/login_backend.dart';
import 'package:la_logistics/backend_files/provider_state.dart';
import 'package:la_logistics/backend_files/update_docket_backend.dart';
import 'package:la_logistics/backend_files/update_profile_backend.dart';
import 'package:la_logistics/screens/DrawerScreen.dart';
// import 'package:la_logistics/screens/bottom_nav_bar.dart';
import 'package:la_logistics/screens/create_pod.dart';
import 'package:la_logistics/screens/delivery_screen.dart';
import 'package:la_logistics/screens/docket_delivery.dart';
import 'package:la_logistics/screens/docket_details.dart';
import 'package:la_logistics/screens/docket_pod.dart';
import 'package:la_logistics/screens/docket_updates.dart';
import 'package:la_logistics/screens/edit_profile_screen.dart';
import 'package:la_logistics/screens/edit_user_profile.dart';
import 'package:la_logistics/screens/first_screen.dart';
import 'package:la_logistics/screens/home_screens.dart';
import 'package:la_logistics/screens/login_with_phone.dart';
import 'package:la_logistics/screens/notification_screen.dart';
import 'package:la_logistics/screens/otp_screen.dart';
import 'package:la_logistics/screens/pickup_docket.dart';
import 'package:la_logistics/screens/pickup_screen.dart';
import 'package:la_logistics/screens/profile_screen.dart';
import 'package:la_logistics/screens/qr_scanner.dart';
import 'package:la_logistics/screens/scan_docket.dart';
import 'package:la_logistics/screens/show_docket.dart';
import 'package:la_logistics/screens/signin.dart';
import 'package:la_logistics/screens/splash_screen.dart';
import 'package:la_logistics/screens/track_docket.dart';
import 'package:la_logistics/screens/update_docket.dart';
import 'package:la_logistics/screens/update_pickup.dart';
import 'package:la_logistics/screens/updating_docket.dart';
import 'package:la_logistics/screens/user_profile.dart';
import 'package:la_logistics/screens/view_pod.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xFF3F3351)));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetDocketById>(
          create: (context) => GetDocketById(),
        ),
        ChangeNotifierProvider<LogInBackend>(
          create: (context) => LogInBackend(),
        ),
        ChangeNotifierProvider<UpdateDocketBackend>(
          create: (context) => UpdateDocketBackend(),
        ),
        ChangeNotifierProvider<DocketDeliveyDetails>(
          create: (context) => DocketDeliveyDetails(),
        ),
        ChangeNotifierProvider<ProviderState>(
          create: (context) => ProviderState(),
        ),
        ChangeNotifierProvider<UpdateProfileBackend>(
          create: (context) => UpdateProfileBackend(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Khimji Poonja Cold Chain Logistic PVT LTD',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: const SplashScreen(),
        routes: {
          DrawerScreen.routeName:(context) => const DrawerScreen(),
          // UserProfile.routeName:(context) => const UserProfile(),
          EditUserProfile.routeName:(context) => const EditUserProfile(),
          NotificationScreen.routeName:(context) => const NotificationScreen(),
          DocketPod.routeName:(context) => const DocketPod(),
          OtpScreen.routeName:(context) => OtpScreen(),
          FirstScreen.routeName:(context) => const FirstScreen(),
          LoginWithPhone.routeName:(context) => const LoginWithPhone(),
          DocketDelivery.routeName:(context) => const DocketDelivery(),
          DocketDetails.routeName:(context) => const DocketDetails(),
          DocketUpdates.routeName:(context) => const DocketUpdates(),
          HomeSCreen.routeName:(context) => const HomeSCreen(),
          // ProfileScreen.routeName:(context) => const ProfileScreen(),
          ScanDocket.routeName:(context) => const ScanDocket(),
          SignInPage.routeName:(context) => const SignInPage(),
          TrackDocket.routeName:(context) => const TrackDocket(),
          UpdateDocket.routeName:(context) => const UpdateDocket(),
          UpdatingDocketScreen.routeName:(context) => const UpdatingDocketScreen(),
          // BottomNavBarScreen.routeName:(context) => const BottomNavBarScreen(),
          EditProfileScreen.routeName:(context) => const EditProfileScreen(),
          QrScannerScreen.routeName:(context) => const QrScannerScreen(),
          SplashScreen.routeName:(context) => const SplashScreen(),
          PickupDocket.routeName:(context) => const PickupDocket(),
          UpdatePickup.routeName:(context) => const UpdatePickup(),
          PickupScreen.routeName:(context) => const PickupScreen(),
          DeliveryScreen.routeName:(context) => DeliveryScreen(),
          CreatePod.routeName:(context) => const CreatePod(),
          // ViewPod.routeName:(context) => const ViewPod(),
          ShowDocket.routeName:(context) =>  ShowDocket()
        },
      ),
    );
  }
}
