import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tugas/Tugas%209%20Flutter/drawer2.dart';

class T10SignUp extends StatefulWidget {
  const T10SignUp({super.key});

  @override
  State<T10SignUp> createState() => _T10SignUpState();
}

class _T10SignUpState extends State<T10SignUp> {
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool isVisibility = false;

void visibilityOnOff() {
  setState(() {
    isVisibility = !isVisibility;
  });
}
void dialogSuccess(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text("Thankyou",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email: ${emailController.text}, has successfully registered")
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => TugasDrawer2(),
                ),
              );
            },
            child: Text("Next",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ],
      );
    },
  );
}

void dialogError(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text("Email is incorrect"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:
            //singleChildScrollView untuk membuat tampilan dapat di scroll
            //scrollDirection untuk mengatur arah scroll
            //physics untuk mengatur efek scroll
            SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/logoFitGuide.png"),
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    alignment: Alignment.center,
                    //decoration untuk memberikan dekorasi pada container
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //form username
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            //showCursor untuk menampilkan kursor pada TextFormField jika aktif
                            showCursor: true,
                            //autofocus untuk membuat TextFormField otomatis aktif saat pertama kali dibuka
                            autofocus: true,
                            //mengatur posisi text pada TextFormField
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              //prefixIcon untuk menambahkan ikon di dalam TextFormField
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20,
                                color: Colors.white,
                              ),
                              //hintText untuk memberikan petunjuk pada TextFormField saat belum diisi
                              hintText: "Please input your full name",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              //labelText untuk memberikan label pada TextFormField saat di klik
                              labelText: "Full Name",
                            ),
                          ),

                          //form email
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            showCursor: true,
                            autofocus: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                              hintText: "Please input your email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              labelText: "Email",
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email tidak boleh kosong";
                              } else if (!value.contains("@")) {
                                return "Email tidak valid";
                              } else {
                                return null;
                              }
                            }
                          ),

                          //form telepon
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            showCursor: true,
                            autofocus: true,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 20,
                                color: Colors.white,
                              ),
                              hintText: "Please input your phone",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              labelText: "Phone",
                            ),
                            controller: phoneController,
                            validator: (value) {
                              final phone = (value ?? '').trim();
                              if (phone.length > 15) {
                                return "Nomor telepon maksimal 15 digit";
                              }
                              return null;
                            },
                          ),

                          //form password
                        SizedBox(height: 10),
                        TextFormField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          showCursor: true,
                          autofocus: true,
                          obscureText: true,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            hintText: "Please input your password",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                            suffixIcon: InkWell(
                              onTap: visibilityOnOff,
                              child: Icon(
                                isVisibility
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                          
                          validator: (value) {
                            final password = value ?? '';
                            if (password.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            if (password.length < 6) {
                              return "Password minimal 6 karakter";
                            }

                            final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
                            final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
                            final hasNumber = RegExp(r'\d').hasMatch(password);
                            final hasSpecialChar = RegExp(
                              r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\];\`~+=]',
                            ).hasMatch(password);

                            if (!hasUppercase) {
                              return "Password harus mengandung minimal 1 huruf besar";
                            }
                            if (!hasLowercase) {
                              return "Password harus mengandung minimal 1 huruf kecil";
                            }
                            if (!hasNumber) {
                              return "Password harus mengandung minimal 1 angka";
                            }
                            if (!hasSpecialChar) {
                              return "Password harus mengandung minimal 1 karakter spesial";
                            }

                            return null;
                          },
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green
                          ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                              dialogSuccess(context);
                                } else {
                                  dialogError(context);
                                }
                            },
                            child: Text("Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ),

                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Or Continue With",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.g_mobiledata_outlined,
                                  size: 40,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook_outlined,
                                size: 25,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 7),
                              Text(
                                "Continue with Facebook",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),]
                  )
              ))],
              ),
            ),
        )
      );
  }
}
