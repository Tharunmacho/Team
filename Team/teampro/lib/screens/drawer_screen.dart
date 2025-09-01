import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'catalogue_screen.dart';
import 'settings_screen.dart';
import 'language_screen.dart';
import 'help_screen.dart';
import 'about_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_conditions_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

     @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: SafeArea(
         child: Column(
        children: [
          // Profile Header Section
          Container(
            height: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE3F2FD),
                  Color(0xFFBBDEFB),
                ],
              ),
            ),
            child: Stack(
              children: [
                // Wavy background element
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomPaint(
                    painter: WavyBackgroundPainter(),
                  ),
                ),
                // Close button
                Positioned(
                  top: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                // Profile content
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile picture, name, and camera icon
                      Row(
                        children: [
                          // Profile picture
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Container(
                                color: Color(0xFF1976D2),
                                child: Icon(
                                  Icons.person,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          // Name and role
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ramachandran A...',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Super Admin',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Camera icon
                          GestureDetector(
                            onTap: () {
                              // Handle camera action
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF1976D2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Menu Items Section
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(
                    Icons.person_outline,
                    'My Profile',
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                  ),
                                     _buildMenuItem(
                     Icons.how_to_vote_outlined,
                     'Your Elections',
                     () {
                       Navigator.pop(context);
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => CatalogueScreen(),
                         ),
                       );
                     },
                   ),
                  _buildMenuItem(
                    Icons.settings,
                    'Settings',
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    },
                  ),
                                     _buildMenuItem(
                     Icons.translate,
                     'App Language',
                     () {
                       Navigator.pop(context);
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => LanguageScreen(),
                         ),
                       );
                     },
                   ),
                  _buildMenuItem(
                    Icons.lock_outline,
                    'Change Password',
                    () {
                      _showChangePasswordDialog(context);
                    },
                  ),
                                     _buildMenuItem(
                     Icons.privacy_tip_outlined,
                     'Privacy Policy',
                     () {
                       Navigator.pop(context);
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) => PrivacyPolicyScreen(),
                         ),
                       );
                     },
                   ),
                  _buildMenuItem(
                    Icons.description_outlined,
                    'Terms & Conditions',
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsConditionsScreen(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    Icons.help_outline,
                    'Help',
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpScreen(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    Icons.info_outline,
                    'About',
                    () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // App Version
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'V.3.1',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ));
  }



  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.black87,
            size: 24,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        ),
        Divider(
          height: 1,
          color: Colors.grey[300],
          indent: 60,
          endIndent: 20,
        ),
      ],
    );
  }
}

class WavyBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF90CAF9).withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.7,
      size.width * 0.5,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.9,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

  void _showChangePasswordDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title and Close button
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Instruction text
              Text(
                'Send OTP',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              
              // OTP destination text
              Text(
                'OTP will be sent to 9994235009',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),
              
              // Send OTP button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle send OTP
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('OTP sent to 9994235009'),
                        backgroundColor: Color(0xFF1976D2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
