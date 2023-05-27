import 'package:flutter/material.dart';

import 'constants/constants_colors.dart';
import 'package:google_fonts/google_fonts.dart';

// const primaryColor = Color(0xFFFF69AE);
// const colorAccent = Color(0xFFE1F2F0);
// const lightGray = Color(0xFFcccccc);
// const textLargeColor = Color(0xff4B4A4C);
// const homeMediumColor = Color(0xff121111);
// const kSecondaryColor = Color(0xffFEE6E7);
// const textFieldBackground = Color(0xff1F1F1F);

const kDefaultPadding = 20.0;

// BoxShadow shadow = BoxShadow(
//   color: Colors.grey.withOpacity(0.2),
//   spreadRadius: 0.4,
//   blurRadius: 1,
//   offset: const Offset(0, 1),
// );
// ThemeData lightTheme = ThemeData(
//   tabBarTheme: const TabBarTheme(
//     indicator: UnderlineTabIndicator(
//       borderSide: BorderSide(
//         color: primaryColor,
//         width: 2,
//       ),
//     ),
//   ),
//   brightness: Brightness.light,
//   primaryColor: primaryColor,
//   secondaryHeaderColor: colorAccent,
//   dividerColor: lightGray,
//   fontFamily: 'Montserrat',
//   textTheme: const TextTheme(
//     bodySmall: TextStyle(
//       color: Colors.black87,
//       fontSize: 12,
//     ),
//     bodyMedium: TextStyle(
//       color: Colors.black87,
//       fontSize: 16,
//     ),
//     bodyLarge: TextStyle(
//       color: Colors.black87,
//       fontSize: 20,
//     ),
//     titleLarge: TextStyle(
//       fontFamily: "MontserratBold",
//       color: textLargeColor,
//       fontSize: 28,
//     ),
//     titleMedium: TextStyle(
//       fontWeight: FontWeight.bold,
//       color: Colors.black87,
//       fontSize: 14.3,
//     ),
//     titleSmall: TextStyle(
//       color: Colors.black87,
//       fontWeight: FontWeight.bold,
//       fontSize: 12,
//     ),
//     headlineSmall: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w400,
//       fontSize: 12,
//     ),
//     headlineMedium: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w400,
//       fontSize: 16,
//     ),
//     headlineLarge: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//     ),
//   ),
//   scaffoldBackgroundColor: Colors.white,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Colors.white,
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//     backgroundColor: Colors.white,
//     elevation: 0,
//   ),
// );

// ThemeData darkTheme = ThemeData(
//   tabBarTheme: const TabBarTheme(
//     indicator: UnderlineTabIndicator(
//       borderSide: BorderSide(
//         color: primaryColor,
//         width: 2,
//       ),
//     ),
//   ),
//   brightness: Brightness.dark,
//   primaryColor: primaryColor,
//   secondaryHeaderColor: const Color(0xFF1E1E1E),
//   dividerColor: const Color(0xFF515151),
//   fontFamily: 'Montserrat',
//   textTheme: const TextTheme(
//     bodySmall: TextStyle(
//       color: Colors.white,
//       fontSize: 12,
//     ),
//     bodyMedium: TextStyle(
//       color: Colors.white,
//       fontSize: 16,
//     ),
//     bodyLarge: TextStyle(
//       color: Colors.white,
//       fontSize: 20,
//     ),
//     titleLarge: TextStyle(
//       fontFamily: "MontserratBold",
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     ),
//     titleMedium: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 16,
//     ),
//     titleSmall: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 12,
//     ),
//     headlineSmall: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w400,
//       fontSize: 12,
//     ),
//     headlineMedium: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.w400,
//       fontSize: 16,
//     ),
//     headlineLarge: TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//       fontSize: 24,
//     ),
//   ),
//   scaffoldBackgroundColor: const Color(0xFF121212),
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Color(0xFF121212),
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//     backgroundColor: Color(0xFF121212),
//     elevation: 0,
//   ),
// );

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme.copyWith(backgroundColor: kContentColorLightTheme),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: textSecondaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: textPrimaryColor),
    textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: textPrimaryColor),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: textSecondaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
