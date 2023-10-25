import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:emp_sys/pages/forgotpassword.dart';
import 'package:emp_sys/pages/landingPage.dart';
import 'package:emp_sys/widgets/multi.dart';
import 'package:emp_sys/widgets/underedMulti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:typewritertext/typewritertext.dart';
import '../statemanager/provider.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    bool isVisible = false;

  @override
  void initState() {
    super.initState();
    // Delay for 5 seconds and then make the widget visible.
    Future.delayed(Duration(seconds: 9), () {
      if (mounted) {
        setState(() {
          isVisible = true;
        });
      }
    });
  }
  final email = TextEditingController();

  final password = TextEditingController();

  @override
  final _formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimateGradient(
            primaryBegin: Alignment.topLeft,
           primaryEnd: Alignment.bottomLeft,
           secondaryBegin: Alignment.bottomLeft,
           secondaryEnd: Alignment.topRight,
           primaryColors: const [
            Color.fromARGB(255, 10, 148, 223),
                Color.fromARGB(255, 182, 42, 190)
           ],
           secondaryColors: const [
            Color.fromARGB(255, 182, 42, 190),
             Color.fromARGB(255, 10, 148, 223),
                
           ],
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         "https://img.freepik.com/free-photo/vivid-shades-colors-blur_23-2147734221.jpg"),
                  //     fit: BoxFit.fill),
          
              //     gradient: LinearGradient(colors: [
                
              // ])
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/20,
                              height: 1,
                            ),
                            TypeWriterText(
                                repeat: false,
                                text: Text("Hi,\nWelcome To Zelle Solutions...",
                                
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, letterSpacing: 0.2,
                      fontSize:(size.width>1245)?50:(size.width<1246 && size.width>1100)? 40:(size.width>799 && size.width<1000)?20:30,
                      fontWeight: FontWeight.bold),
                    ),),
                                duration: const Duration(milliseconds: 200)),
                          ],
                        ),
                            Visibility(
                              visible: !isVisible,
                              child: Container(height:(size.width>799 && size.width<1000)?50: 100,width: 100,)),
                            Visibility(
      visible: isVisible,
      child: TweenAnimationBuilder(
         duration: Duration(milliseconds: 3000),
                        curve: Curves.linearToEaseOut,
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, value, child) {
                          // horizontal disposition of the widget.
                          return Transform.translate(
                            offset:
                                Offset( (size.width>799 && size.width<1000)?value * MediaQuery.of(context).size.width/30:value * MediaQuery.of(context).size.width/20,0),
                            child: child,
                          );
                        },
        child: Container(
                               height:(size.width>799 && size.width<1000)?50: 100,
                               width: size.width/1.5,
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                   SizedBox(width: 20.0, height: 100.0),
                                  Multi(color: Colors.white, subtitle: "Ignite", weight: FontWeight.bold, size: 7),
                                  SizedBox(width: 20.0, height: 100.0),
                                  DefaultTextStyle(
                                 
                                    style: const TextStyle(
                                      fontSize: 40.0,
                                      
                                    ),
                                    child: AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        RotateAnimatedText('Your Passion, Fuel Your Success.',duration: Duration(milliseconds: 5000) ,textStyle:GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: 0.2,fontSize: 7.sp,fontWeight: FontWeight.bold),)),
                                        RotateAnimatedText('Innovation, Spark Transformation.',textStyle:GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: 0.2,fontSize: 7.sp,fontWeight: FontWeight.bold),),duration: Duration(milliseconds: 5000)),
                                        RotateAnimatedText('Your Drive, Illuminate Your Future.',textStyle:GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: 0.2,fontSize: 7.sp,fontWeight: FontWeight.bold),),duration: Duration(milliseconds: 5000)),
                                        RotateAnimatedText('Excellence, Ignite Extraordinary Results.',textStyle:GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: 0.2,fontSize: 7.sp,fontWeight: FontWeight.bold),),duration: Duration(milliseconds: 5000)),
                                      ],
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              ),
      )
    )
                            
                      ],
                    ),
                  ),
                  Expanded(
                    flex: (size.width>799 && size.width<1000)?7:5,
                    child: Padding(
                      padding:  EdgeInsets.only(
                        right: (size.width>799 && size.width<1000)?20:
                        (size.width>999 && size.width<1201)?25
                        :0
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                          //   child: Text(
                          //     'HI',
                          //     style: TextStyle(
                          //         fontSize: 45,
                          //         fontWeight: FontWeight.w400,
                          //         color: Color.fromARGB(255, 255, 255, 255)),
                          //   ),
                          // ),
                          // const Padding(
                          //   padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          //   child: Text(
                          //     'WELCOME BACK',
                          //     style: TextStyle(
                          //         fontSize: 65,
                          //         fontWeight: FontWeight.w400,
                          //         color: Color.fromARGB(255, 255, 255, 255)),
                          //   ),
                          // ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                          
                              GlassContainer(
                                border: Border.fromBorderSide(BorderSide.none),
                                    shadowStrength: 5,
                                    borderRadius: BorderRadius.circular(16),
                                    shadowColor: Colors.white.withOpacity(0.24),
                                height: size.height/1.5,
                                  width:(size.width>799 && size.width<901)?450: 400,
                                  blur: 8,
                      color: Colors.black.withOpacity(0.1),
                                child: Padding(
                                  padding:EdgeInsets.symmetric(horizontal: 20),
                                  child: Form(
                                    key: _formKey,
                                    
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/images/zelle.png",height: 90,width: 150,color: Colors.white,),
                                          ],
                                        ),
                                        // SizedBox(height: 20,),
                                       Multi(color: Colors.white, subtitle: "Email", weight: FontWeight.w500, size: 3.7),
                                        SizedBox(height: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: const GradientBoxBorder(
                                                gradient: LinearGradient(colors: [
                                                Colors.white,
                                                Colors.white,
                                                ]),
                                                width: 3,
                                              )),
                                          child: TextFormField(
                                              onFieldSubmitted: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    Provider11.signInWithEmailPassword(
                                                  email.text, password.text, context);
                                  }
                                                        },
                                            controller: email,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300, color: Colors.white),
                                            cursorColor: Colors.white,
                                             validator: (value) =>
                                            value!.isEmpty ? 'Email cannot be blank' : null,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(8),
                                              hintText: 'abc@gamil.com',
                                              hintStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30,),
                                      Multi(color: Colors.white, subtitle: "Password", weight: FontWeight.w500, size: 3.7),
                                        SizedBox(height: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              border: const GradientBoxBorder(
                                                gradient: LinearGradient(colors: [
                                                  Colors.white,
                                                     Colors.white,
                                                ]),
                                                width: 3,
                                              )),
                                          child: TextFormField(
                                            onFieldSubmitted: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    Provider11.signInWithEmailPassword(
                                                  email.text, password.text, context);
                                  }
                                                        },
                                            obscureText: true,
                                            controller: password,
                                             validator: (value) =>
                                            value!.isEmpty ? 'Password cannot be blank' : null,
                                            cursorColor: Colors.white,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding: EdgeInsets.all(10),
                                              hintText: '***',
                                              hintStyle: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                   SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(),
                                        GestureDetector(
                                          onTap: () {
                                  
                                            Navigator.push(context,
                                         MaterialPageRoute(builder: (context) => ForgotPassword()));
                                            
                                          },
                                          child: Text('Forgot Password',style: TextStyle(fontSize: 15,color: Colors.white,),),),
                                      ],
                                    ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          child:Provider11.loginState==false?  Container(
                                            height: 44.0,
                                            width: double.infinity,
                                           
                                            child: ElevatedButton(
                                              onPressed: ()async {
                                                if (_formKey.currentState!.validate()) {
                                                  Provider11.signInWithEmailPassword(
                                                    email.text, password.text, context);
                                                }
                                               
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  shadowColor: Colors.black,
                                                  
                                                  ),
                                              child: Multi(color: Color(0xff002AC4), subtitle: "Log In", weight: FontWeight.bold, size: 3),
                                            ),
                                          ):spinkit,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
             Positioned(
            right: 20,
            bottom: 20,
            child: MultiUnderLined(color: Colors.white, subtitle: "Managed & Powered by Zelle Solutions Pvt Ltd", weight: FontWeight.bold, size: 3)),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/zelle.png",height: 100,width: 200,color: Colors.white,),)
        ],
      ),
    );
  }
}