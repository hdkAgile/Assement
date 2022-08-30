import 'package:flutter/material.dart';
import 'enum_all.dart';
import 'package:assement/Utils/extensions.dart';

//AppColors
class AppColors {
  static Color themeGreen = const Color(0xFF1DCC8D);
  static Color themeWhite = const Color(0xFFFFFFFF);
  static Color themePink = const Color(0xFFF56363);
  static Color themeLightGreen = const Color(0xFF63F5A6);
  static Color themeBorderLightGreen = const Color(0xFF14A26F80);
  static Color themeGrey = const Color(0xff0000006a);
  static Color themeBlack = const Color(0xFF000000);
  static Color themeBlue = const Color(0xFF3D5B97);
  static Color themeBorderGreen = const Color(0xFF1DCC8D);
  static Color themeLightGrey = const Color(0xFFF7F7F7);
  static Color themeLightGrey1 = const Color(0xFF707070);
  static Color themeTextGrey = const Color(0xFF9D9D9D);
  static Color themeTextLightGrey = const Color(0xFF888888);
  static Color themeDarkGrey = const Color(0xFF646464);
  static Color themeDarkTextGrey = const Color(0xFFCBCBCB);
  static Color themeLightTextGrey = const Color(0xFFF5F5F5);
  static Color themeBoxGrey = const Color(0xFF0000003B);
  static Color themeBorderGrey = const Color(0xFF0000004B);
  static Color themeDiverGrey = const Color(0xFFD8D8D8);
  static Color themeTabColor = const Color(0XFFF2F2F2);
  static Color themeDarkBackgroundGrey = const Color(0XFF707070);
}

//Images
class AppImages {
  static String imgPath = 'assets/images/';
  static String splashImage = '${imgPath}raf_logo.png';
  static String starImage = '${imgPath}images/star.png';
  static String welcomeLogo = '${imgPath}Welcome.png';
  static String isVendor = '${imgPath}is_vendor.png';
  static String addPhoto = '${imgPath}add_photo.png';
  static String apple = '${imgPath}apple.png';
  static String backArrow = '${imgPath}back_arrow.png';
  static String arrowRight = '${imgPath}arrow_right.png';
  static String camAlter = '${imgPath}cam_alt.png';
  static String camera = '${imgPath}camera.png';
  static String category1 = '${imgPath}category1.png';
  static String category2 = '${imgPath}category2.png';
  static String category3 = '${imgPath}category3.png';
  static String category4 = '${imgPath}category4.png';
  static String category5 = '${imgPath}category5.png';
  static String category6 = '${imgPath}category6.png';
  static String category7 = '${imgPath}category7.png';
  static String checkBox = '${imgPath}checkbox.png';
  static String circle = '${imgPath}circle.png';
  static String clickPic = '${imgPath}click_pic.png';
  static String close = '${imgPath}close.png';
  static String closeWhite = '${imgPath}close_white.png';
  static String contactUs = '${imgPath}contactus.png';
  static String doneImage = '${imgPath}done_image.png';
  static String elipseBack = '${imgPath}elipse_back.png';
  static String elipseGreen = '${imgPath}elipse_green.png';
  static String email = '${imgPath}email.png';
  static String endingSoon1 = '${imgPath}ending_soon_image_1.png';
  static String endingSoon2 = '${imgPath}ending_soon_image_2.png';
  static String endingSoon3 = '${imgPath}ending_soon_image_3.png';
  static String fabIcon = '${imgPath}fab_icon.png';
  static String facebookImage = '${imgPath}facebook.png';
  static String filterIcon = '${imgPath}filter_icon.png';
  static String flashOff = '${imgPath}flash_off.png';
  static String flashOn = '${imgPath}flash_on.png';
  static String folderImage = '${imgPath}folder.png';
  static String grid = '${imgPath}grid.png';
  static String gridActive = '${imgPath}grid_active.png';
  static String list = '${imgPath}list.png';
  static String listActive = '${imgPath}list_active.png';
  static String heartFill = '${imgPath}heart_fill.png';
  static String heartIcon = '${imgPath}heart_icon.png';
  static String image01 = '${imgPath}image_01.png';
  static String image02 = '${imgPath}image_02.png';
  static String imagePlaceholder = '${imgPath}image_placeholder.png';
  static String infoImage = '${imgPath}info.png';
  static String labelLWhite = '${imgPath}label_LWhite.png';
  static String labelMWhite = '${imgPath}label_MWhite.png';
  static String labelSmaill = '${imgPath}label_small.png';
  static String location = '${imgPath}location.png';
  static String search = '${imgPath}search.png';
  static String rightArrow = '${imgPath}arrow_right.png';
  static String winnerCircle1 = '${imgPath}winner_circlr_img1.png';
  static String winnerCircle2 = '${imgPath}winner_circlr_img2.png';
  static String winnerCircle3 = '${imgPath}winner_circlr_img3.png';
  static String homeTabIcon = '${imgPath}nav_icon_1.png';
  static String homeTabActiveIcon = '${imgPath}nav_icon_1_active.png';
  static String searchTabIcon = '${imgPath}nav_icon_2.png';
  static String searchTabActiveIcon = '${imgPath}nav_icon_2_active.png';
  static String notificationTabIcon = '${imgPath}nav_icon_3.png';
  static String notificationTabActiveIcon = '${imgPath}nav_icon_3_active.png';
  static String profileTabIcon = '${imgPath}nav_icon_4.png';
  static String profileTabActiveIcon = '${imgPath}nav_icon_4_active.png';
  static String product = '${imgPath}product.png';
  static String johnSmith = '${imgPath}john_smith.png';
  static String starFillSmall = '${imgPath}star_fill_small.png';
  static String more_horiz = '${imgPath}more_horiz.png';
  static String heart = '${imgPath}heart_icon.png';
  static String heart_Fill = '${imgPath}heart_fill.png';
  static String dropDownArrow = '${imgPath}small_down_arrow.png';
  static String plus = 'assets/new_plus.png';
  static String info = '${imgPath}info.png';
  static String blackArrowRight = '${imgPath}R_black_arrow.png';
}

class ScreenRoutesConstant {
  // common screens
  static const String splashScreen = "/splashScreen";
  static const String welcomeScreen = '/welcomeScreen';
  static const String homeScreen = "/homeScreen";
  static const String searchScreen = '/searchScreen';

// auth related screens
  static const String createAccount = "/createAccount";
  static const String homeTab = "/homeTab";

// profile related screens
  static const String profileScreen = "/profileScreen";
}

//Fonts
class AppFonts {
  static String openSansBold = 'OpenSansBold';
  static String openSansLight = 'OpenSansLight';
  static String openSansExtraBold = 'OpenSansExtraBold';
  static String openSansRegular = 'OpenSansRegular';
  static String openSansSemiBold = 'OpenSansSemiBold';
  static String SFProDisplay = 'SF Pro Display';
}

//TextStyle
class AppTextStyle {
  //Bold
  static TextStyle openSans_bold_white_16 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.themeWhite,
      fontSize: 16.0,
      fontFamily: AppFonts.openSansBold);
  static TextStyle openSans_semibold_black_12 = TextStyle(
      fontFamily: AppFonts.openSansSemiBold,
      fontWeight: FontWeight.bold,
      color: AppColors.themeBlack,
      fontSize: 12.0);
  static TextStyle openSans_bold_green_18 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: AppColors.themeBorderGreen);
  static TextStyle openSans_semibold_black_18 = TextStyle(
      fontFamily: AppFonts.openSansSemiBold,
      fontWeight: FontWeight.bold,
      color: AppColors.themeBlack,
      fontSize: 18.0);
  static TextStyle openSans_bold_green_15 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontWeight: FontWeight.bold,
      color: AppColors.themeGreen,
      letterSpacing: 1.5,
      fontSize: 15.0);
  static TextStyle openSans_semibold_darkGrey_10 = TextStyle(
      fontFamily: AppFonts.openSansSemiBold,
      color: AppColors.themeDarkGrey,
      fontSize: 10.0);
  static TextStyle openSans_bold_themeBlack_10 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      color: AppColors.themeBlack,
      letterSpacing: 1.0,
      fontSize: 10.0);
  static TextStyle openSans_bold_themeBlack_20 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      color: AppColors.themeBlack,
      letterSpacing: 2.0,
      fontSize: 20.0);
  static TextStyle openSans_regular_black_15 = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: AppFonts.openSansRegular,
      color: AppColors.themeBlack,
      fontSize: 15);
  static TextStyle openSans_bold_white_17 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.themeWhite,
      letterSpacing: 1.7,
      fontFamily: AppFonts.openSansBold,
      fontSize: 17);

  static TextStyle openSans_bold_darkGrey_17 = TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.themeDarkTextGrey,
      fontFamily: AppFonts.openSansBold,
      letterSpacing: 1.7,
      fontSize: 17);
  static TextStyle openSans_semibold_textGrey_14 = TextStyle(
      color: AppColors.themeTextGrey,
      fontFamily: AppFonts.openSansSemiBold,
      letterSpacing: 0.0,
      fontSize: 14);

  static TextStyle openSans_regular_textGrey1_14 = TextStyle(
      color: AppColors.themeLightGrey1,
      fontFamily: AppFonts.openSansRegular,
      letterSpacing: 1.4,
      fontSize: 14);
  static TextStyle openSans_extrabold_themeBlack_16 = TextStyle(
      fontFamily: AppFonts.openSansExtraBold,
      fontSize: 16,
      letterSpacing: 1.6,
      color: AppColors.themeBlack);

  static TextStyle openSans_semibold_themeTextGrey_14 = TextStyle(
      fontFamily: AppFonts.openSansSemiBold,
      fontSize: 14,
      color: AppColors.themeTextGrey);
  static TextStyle openSans_bold_themeDarkGrey_12 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeDarkGrey);

  static TextStyle openSans_bold_themeBlack_18 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 18,
      letterSpacing: 1.8,
      color: AppColors.themeBlack);
  static TextStyle openSans_bold_themeTextGrey_12 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeTextGrey);
  static TextStyle openSans_bold_darkGrey_14 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 14,
      letterSpacing: 1.4,
      color: AppColors.themeDarkGrey);

  static TextStyle openSans_regular_themeTextGrey_12 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeTextGrey);

  static TextStyle openSans_regular_themeTextGrey_14 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 14,
      letterSpacing: 1.4,
      color: AppColors.themeDarkTextGrey);

  static TextStyle openSans_regular_themeGreen_16 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 16,
      letterSpacing: 1.6,
      color: AppColors.themeGreen);

  static TextStyle openSans_regular_themeBlack_16 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 16,
      letterSpacing: 1.6,
      color: AppColors.themeBlack);

  static TextStyle openSans_light_themeBlack_12 = TextStyle(
      fontFamily: AppFonts.openSansLight,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeBlack);

  static TextStyle openSans_regular_themeBlack_24 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 24,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeBlack_26 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 26,
      color: AppColors.themeBlack);

  static TextStyle openSans_regular_themeBlack_12 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 12,
      // letterSpacing: 1.2,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeBlack_12 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeBlack_29 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 29,
      letterSpacing: 2.9,
      color: AppColors.themeBlack);
  static TextStyle openSans_semibold_themeBlack_15_ = TextStyle(
      fontFamily: AppFonts.openSansSemiBold,
      fontSize: 15,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeBlack_16 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 16,
      letterSpacing: 1.6,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeGreen_16 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 16,
      letterSpacing: 1.6,
      color: AppColors.themeGreen);
  static TextStyle sfPro_regular_them = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 12,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeBlack_14 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 14,
      letterSpacing: 1.4,
      color: AppColors.themeBlack);

  static TextStyle openSans_regular_themeBlack_10 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeBlack);

  static TextStyle openSans_regular_themeBlack_14 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 14,
      letterSpacing: 1.4,
      color: AppColors.themeBlack);
  static TextStyle openSans_regular_themeWhite_10 = TextStyle(
      fontFamily: AppFonts.openSansRegular,
      fontSize: 10,
      color: AppColors.themeWhite);
  static TextStyle openSans_bold_themeWhite_14 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 14,
      color: AppColors.themeWhite);
  static TextStyle openSans_bold_themeWhite_17 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 17,
      letterSpacing: 1.7,
      color: AppColors.themeWhite);

  static TextStyle openSans_semibold_themeBlack_15 = TextStyle(
      fontFamily: AppFonts.openSansSemiBold,
      fontSize: 15,
      color: AppColors.themeBlack);
  static TextStyle openSans_extraBold_themeBlack_22 = TextStyle(
      fontFamily: AppFonts.openSansExtraBold,
      fontSize: 22,
      letterSpacing: 2.2,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeBlack_25 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 25,
      letterSpacing: 2.5,
      color: AppColors.themeBlack);

  static TextStyle openSans_bold_themeGreen_12 = TextStyle(
      fontFamily: AppFonts.openSansBold,
      fontSize: 12,
      letterSpacing: 1.2,
      color: AppColors.themeGreen);

  static TextStyle sfProDisplay_regular_themeGreen_12 = TextStyle(
      fontFamily: AppFonts.SFProDisplay,
      fontSize: 12,
      letterSpacing: 0.05,
      color: AppColors.themeGreen);

  static TextStyle sfProDisplay_regular_themeLightTextGrey_12 = TextStyle(
      fontFamily: AppFonts.SFProDisplay,
      fontSize: 12,
      letterSpacing: 0.05,
      color: AppColors.themeTextGrey);
}

//Text
class AppText {
  static String signWithApple = 'Sign in with Apple';
  static String signWithFacebook = 'Sign in with Facebook';
  static String useYourEmail = 'OR USE YOUR EMAIL';
  static String signUp = 'Sign Up';
  static String logIn = 'Log In';
  static String loginTab = "Login";
  static String createAccount = 'Create Account';
  static String email = 'Email';
  static String firstName = 'First Name';
  static String lastName = 'Last Name';
  static String password = 'Password';
  static String forgotPassword = 'Forgot your password?';
  static String searchText = 'Search RaffleUp';
  static String seeMore = 'See more';
  static String winnerCircle = 'Winner’s Circle';
  static String endingSoon = 'Ending Soon';
  static String recentAdded = 'Recently Added';
  static String productName = 'Product name';
  static String amount = '100.00';
  static String categories = "Categories";
  static String johnSmith = 'John Smith';
  static String saveUser = 'SaveUser';
  static String raffle = 'Raffles';
  static String sold = 'Sold';
  static String reviews = 'Reviews';
  static String profile = 'Profile';
  static String logout = 'Logout';
  static String tickets = 'Tickets';
  static String listings = 'Listings';
  static String favorites = 'Favorites';
  static String active = 'Active';
  static String inbox = 'Inbox';
  static String messages = 'Messages';
  static String notifications = 'Notifications';
  static String detail = 'Details';
  static String cancel = 'Cancel';
  static String photos = "Photos";
  static String condition = 'Condition';
  static String conditions = 'Conditions';
  static String category = 'Category';
  static String congratualtion = 'Congratulations!';
  static String raffaleListed = 'Your raffle has been listed!';
}

class PreferenceKeys {
  static String saveUser = 'saveUser';
  static String isLoggedIn = 'isLoggedIn';
}

class AppConfig {
  static URLHost host = URLHost.local;
  static String apiVersion = '/v2/';
}

class AppConstant {
  static String baseURL = AppConfig.host.baseURL;
  static String firebaseKey = AppConfig.host.firebaseKey;
  static String version = AppConfig.apiVersion;
  static String preFixRaffale = 'raffle';
  static int limit = 10;
}

class StringConstant {
  /// common strings
  static const String baseImagePath = 'assets/images';
  static const String poppinsFont = 'Poppins';
  static const String appLatitude = "33.78151350894746";
  static const String appLongitude = "-84.41362900386731";
  static const String requestTimeOutMsg = "requestTimeOutMsg";
  static const String somethingWentWrongMsg = "somethingWentWrongMsg";
  static const String noInternetMsg = "noInternetMsg";
  static const String changeProfilePhotoDialogTitle =
      "changeProfilePhotoDialogTitle";
  static const String changeProfilePhotoDialogDesc =
      "changeProfilePhotoDialogDesc";
  static const String cameraDialogOption = "cameraDialogOption";
  static const String galleryDialogOption = "galleryDialogOption";
  static const String logoutWarningMsg = "logoutWarningMsg";
  static const String yesLabel = "yesLabel";
  static const String noLabel = "noLabel";
  static const String homeLabel = "homeLabel";
  static const String loadNoDataViewLabel = "loadNoDataViewLabel";
  static const String resetOption = "resetOption";
  static const String totalRecordsLabel = "totalRecordsLabel";
  static const String getXDemo = "getXDemo";
  static const String helloWorldLabel = "helloWorldLabel";
  static const String noDataFoundLabel = "noDataFoundLabel";
  static const String gettingDataLabel = "gettingDataLabel";
  static const String appName = "appName";
  static const String prefixForSavingFile = "flutter_agile_getx";

  /// login screen strings
  static const String loginTitle = "loginTitle";
  static const String emailFieldLabel = "emailFieldLabel";
  static const String emailFieldHint = "emailFieldHint";
  static const String passwordFieldLabel = "passwordFieldLabel";
  static const String passwordFieldHint = "passwordFieldHint";
  static const String mandatoryAsterisk = "*";
  static const String enterEmailIDFieldValidation =
      "enterEmailIDFieldValidation";
  static const String enterValidEmailIDFieldValidation =
      "enterValidEmailIDFieldValidation";
  static const String enterPasswordFieldValidation =
      "enterPasswordFieldValidation";
  static const String passwordLengthValidation = "passwordLengthValidation";
  static const String loginButtonLabel = "loginButtonLabel";
  static const String dontHaveAnAccountLabel = "dontHaveAnAccountLabel";
  static const String signupLabel = "signupLabel";
  static const String loginSuccessMsg = "loginSuccessMsg";
  static const String loggingInLabel = "loggingInLabel";

  /// view profile screen strings
  static const String userProfileAppbarTitle = "userProfileAppbarTitle";
  static const String userNameLabel = "userNameLabel";
  static const String emailLabel = "emailLabel";
  static const String mobileLabel = "mobileLabel";
  static const String bioLabel = "bioLabel";
  static const String editProfileBtnLabel = "editProfileBtnLabel";
  static const String languageLabel = "languageLabel";

  /// register / edit profile screen strings
  static const String editProfileAppbarTitle = "editProfileAppbarTitle";
  static const String firstNameFieldLabel = "firstNameFieldLabel";
  static const String lastNameFieldLabel = "lastNameFieldLabel";
  static const String firstNameFieldHint = "firstNameFieldHint";
  static const String lastNameFieldHint = "lastNameFieldHint";
  static const String bioFieldLabel = "bioFieldLabel";
  static const String bioFieldHint = "bioFieldHint";
  static const String mobileNoFieldLabel = "mobileNoFieldLabel";
  static const String mobileNoFieldHint = "mobileNoFieldHint";
  static const String updateBtnLabel = "updateBtnLabel";
  static const String confirmPasswordFieldLabel = "confirmPasswordFieldLabel";
  static const String confirmPasswordFieldHint = "confirmPasswordFieldHint";
  static const String alreadyHaveAnAccountLabel = "alreadyHaveAnAccountLabel";
  static const String loginLabel = "loginLabel";
  static const String registerBtnLabel = "registerBtnLabel";
  static const String enterFirstNameValidation = "enterFirstNameValidation";
  static const String enterValidFirstNameValidation =
      "enterValidFirstNameValidation";
  static const String enterLastNameValidation = "enterLastNameValidation";
  static const String enterValidLastNameValidation =
      "enterValidLastNameValidation";
  static const String enterBioValidation = "enterBioValidation";
  static const String enterValidBioValidation = "enterValidBioValidation";
  static const String enterMobileNoValidation = "enterMobileNoValidation";
  static const String enterValidMobileNoValidation =
      "enterValidMobileNoValidation";
  static const String reEnterPasswordValidation = "reEnterPasswordValidation";
  static const String passwordsNotMatchValidation =
      "passwordsNotMatchValidation";
  static const String signupHeadingLabel = "signupHeadingLabel";
  static const String userCancelledImageSelectionMsg =
      "userCancelledImageSelectionMsg";
}
