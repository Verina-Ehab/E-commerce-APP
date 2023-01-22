class AppLink{
  static const String server = "http://verinaehab.com/ecommerce";
  static const String test = "$server/test.php";

  //Auth
  static const String signUp = "$server/auth/signup.php";
  static const String verificationCode = "$server/auth/verifycode.php";
  static const String logIn = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";
  //Forget Password
  static const String checkEmail = "$server/forgetpassword/checkEmail.php";
  static const String resetPassword = "$server/forgetpassword/resetPassword.php";
  static const String verifyCode = "$server/forgetpassword/verifyCode.php";
  //Images
  static const String imagesCategories = "$server/forgetpassword/checkEmail.php";
  static const String imagesItems = "$server/forgetpassword/resetPassword.php";
  //Home
  static const String home = "$server/home.php";
  //Items
  static const String items = "$server/items/items.php";
  //Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String favoriteDelete = "$server/favorite/deletefromfavorite.php"; //favroite

}