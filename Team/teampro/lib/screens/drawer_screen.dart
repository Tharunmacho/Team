import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'catalogue_screen.dart';
import 'elections_screen.dart';
import 'settings_screen.dart';
import 'language_screen.dart';
import 'privacy_policy_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
<<<<<<< HEAD
            // Modern Header with Wavy Background
            Container(
              height: 200,
=======
            // Header Section with Light Yellow/Cream Background
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFF8E1), // Light yellow/cream
                    Color(0xFFFFF3C4), // Slightly darker cream
                  ],
                ),
              ),
>>>>>>> c00c080087205e881cf4f33e66cf7727d79f01a9
              child: Stack(
                children: [
                  // Wavy gradient background
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF87CEEB), // Sky blue
                            Color(0xFFE0F6FF), // Very light blue
                            Color(0xFFB3E5FC), // Light blue
                          ],
                          stops: [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 20,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
<<<<<<< HEAD
                          color: Colors.white.withOpacity(0.9),
=======
                          color: Colors.white,
>>>>>>> c00c080087205e881cf4f33e66cf7727d79f01a9
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black87,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
<<<<<<< HEAD
                  // Profile section with left-aligned layout
                  Positioned(
                    top: 70,
                    left: 24,
                    right: 24,
                    child: Row(
                      children: [
                        // Profile picture with camera icon
                        Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 12,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              child: ClipOval(
                                child: Container(
                                  color: Color(0xFF1976D2),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                              ),
                            ),
                            // Camera icon overlay
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1976D2),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        // User info section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // User name
                              Text(
                                'ramachandran A...',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Role
                              Text(
                                'Super Admin',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
=======
                  // Profile content - centered
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        // Green rectangular button with megaphone
                        Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF4CAF50),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Megaphone icon
                              Center(
                                child: Icon(
                                  Icons.campaign,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              // Sound waves
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 8,
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                    SizedBox(width: 1),
                                    Container(
                                      width: 2,
                                      height: 12,
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                    SizedBox(width: 1),
                                    Container(
                                      width: 2,
                                      height: 6,
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Name - split into two lines
                        Text(
                          'ramach',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'andran A...',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Super Admin',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Quick action icons - subtle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSubtleIcon(Icons.list_alt),
                            const SizedBox(width: 20),
                            _buildSubtleIcon(Icons.home),
                            const SizedBox(width: 20),
                            _buildSubtleIcon(Icons.camera_alt),
                          ],
>>>>>>> c00c080087205e881cf4f33e66cf7727d79f01a9
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
                  padding: const EdgeInsets.only(top: 20),
                  children: [
                    _buildMenuItem(
                      Icons.person_outline,
                      'My Profile',
                      () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
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
                            builder: (context) => const ElectionsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.settings_outlined,
                      'Settings',
                      () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.language_outlined,
                      'App Language',
                      () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LanguageScreen(),
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
                            builder: (context) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Subtle Quick Action Icons
  Widget _buildSubtleIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.grey[600],
      size: 20,
    );
  }

  // Menu Items
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
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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



// Change Password Bottom Sheet
void _showChangePasswordDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    enableDrag: true,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title and Close button
            Row(
              children: [
                const Expanded(
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
                  child: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              'Send OTP',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'OTP will be sent to 9994235009',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
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
                child: const Text(
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

// Custom clipper for wavy background
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    
    // Start from top-left
    path.lineTo(0.0, size.height - 30);
    
    // Create first wave
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 30);
    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy, 
      firstEndPoint.dx, 
      firstEndPoint.dy
    );
    
    // Create second wave
    var secondControlPoint = Offset(size.width * 0.75, size.height - 10);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
      secondControlPoint.dx, 
      secondControlPoint.dy, 
      secondEndPoint.dx, 
      secondEndPoint.dy
    );
    
    // Complete the path
    path.lineTo(size.width, 0.0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
