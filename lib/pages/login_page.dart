import 'package:demo/pages/categoriesPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Sign in to your account",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  textFieldLogin(hintText: "Email", isIcon: false),
                  const SizedBox(
                    height: 15,
                  ),
                  textFieldLogin(hintText: "Password", isIcon: true),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Spacer(),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff0D9445),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      "----- OR -----",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginGoogleOrFb(img: "google", scale: 13),
                      const SizedBox(
                        width: 20,
                      ),
                      loginGoogleOrFb(img: "fb", scale: 25),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Center(
              child: Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "Signup",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CategoriesPage();
                },));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xff0D9445),
                alignment: Alignment.center,
                child: const Text(
                  "Skip & Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldLogin({hintText, isIcon}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      alignment: Alignment.center,
      child: TextField(
        obscureText: !isPasswordShow,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffc1c1c1),
            ),
            suffixIcon: (isIcon)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                    child: Icon(
                      (isPasswordShow)
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  )
                : null),
      ),
    );
  }

  Widget loginGoogleOrFb({img, required double scale}) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: AssetImage(
                "assets/images/loginPage/$img.png",
              ),
              scale: scale),
          border: Border.all(
            color: const Color(0xffc1c1c1),
          )),
    );
  }
}
