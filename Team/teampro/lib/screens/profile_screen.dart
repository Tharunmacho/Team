import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImageType = 'meeting'; // 'meeting', 'user', or 'camera'
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // Profile header section with curved background
            Container(
              height: 320,
              child: Stack(
                children: [
                  // Curved background
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
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 16,
                    right: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.black54,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  // Profile content
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        // Profile image with camera overlay
                        Stack(
                          children: [
                            Container(
                              width: 140,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF4CAF50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: _profileImage != null
                                    ? Image.file(
                                        _profileImage!,
                                        width: 140,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/political_meeting.jpg',
                                        width: 140,
                                        height: 100,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(0xFF4CAF50),
                                                  Color(0xFF66BB6A),
                                                ],
                                              ),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.campaign,
                                                size: 48,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ),
                            // Camera icon overlay
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: GestureDetector(
                                onTap: _showUploadProfilePictureModal,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1976D2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // User name
                        Text(
                          'ramach',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'andran A...',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Role
                        Text(
                          'Super Admin',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Action buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildActionButton(Icons.list_alt, 'Overview'),
                            const SizedBox(width: 24),
                            _buildActionButton(Icons.home, 'Home'),
                            const SizedBox(width: 24),
                            _buildActionButton(Icons.camera_alt, 'Camera'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu items section
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    _buildMenuItem(Icons.person_outline, 'My Profile'),
                    _buildMenuItem(Icons.how_to_vote_outlined, 'Your Elections'),
                    _buildMenuItem(Icons.settings_outlined, 'Settings'),
                    _buildMenuItem(Icons.language_outlined, 'App Language'),
                    _buildMenuItem(Icons.lock_outline, 'Change Password'),
                    _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
                    _buildMenuItem(Icons.description_outlined, 'Terms & Conditions'),
                    _buildMenuItem(Icons.help_outline, 'Help'),
                    _buildMenuItem(Icons.info_outline, 'About'),
                    const Spacer(),
                    // Version info
                    Text(
                      'V.3.1 |',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
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

  void _showUploadProfilePictureModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Upload Profile Picture',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Choose a method to update your profile',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 30),
            // Take Photo Button
            Container(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => _takePhoto(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: 24),
                    const SizedBox(width: 12),
                    Text(
                      'Take',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Choose from Gallery Button
            Container(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => _chooseFromGallery(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1976D2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 24),
                    const SizedBox(width: 12),
                    Text(
                      'Choose from',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Cancel Button
            Container(
              width: double.infinity,
              height: 55,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _takePhoto() async {
    Navigator.pop(context); // Close modal first
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile picture updated successfully!'),
            backgroundColor: Color(0xFF4CAF50),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error taking photo: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _chooseFromGallery() async {
    Navigator.pop(context); // Close modal first
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Profile picture updated successfully!'),
            backgroundColor: Color(0xFF4CAF50),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error choosing photo: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.black87,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          if (isLogout) {
            _showLogoutDialog();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title - Feature coming soon!'),
                backgroundColor: Color(0xFF1976D2),
              ),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: Row(
            children: [
              Icon(
                icon,
                color: isLogout ? Colors.red : Color(0xFF1976D2),
                size: 24,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: isLogout ? Colors.red : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
