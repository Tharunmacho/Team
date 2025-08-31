import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _profileImageType = 'meeting'; // 'meeting', 'user', or 'camera'

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
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: _getProfileImageColors(),
                                ),
                              ),
                              child: Center(
                                child: _getProfileImageIcon(),
                              ),
                            ),
                            // Camera icon overlay
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: GestureDetector(
                                onTap: _changeProfilePhoto,
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
                          'ramachandran ...',
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: ListView(
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
                    const SizedBox(height: 20),
                    _buildMenuItem(Icons.logout, 'Logout', isLogout: true),
                    const SizedBox(height: 20),
                    // Version info
                    Center(
                      child: Text(
                        'V.3.1 | 21-May-2025',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
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

  List<Color> _getProfileImageColors() {
    switch (_profileImageType) {
      case 'meeting':
        return [Color(0xFF4CAF50), Color(0xFF66BB6A)];
      case 'user':
        return [Color(0xFF1976D2), Color(0xFF42A5F5)];
      case 'camera':
        return [Color(0xFFFF5722), Color(0xFFFF8A65)];
      default:
        return [Color(0xFF4CAF50), Color(0xFF66BB6A)];
    }
  }

  Widget _getProfileImageIcon() {
    switch (_profileImageType) {
      case 'meeting':
        return Icon(
          Icons.campaign,
          size: 48,
          color: Colors.white,
        );
      case 'user':
        return Icon(
          Icons.person,
          size: 48,
          color: Colors.white,
        );
      case 'camera':
        return Icon(
          Icons.camera_alt,
          size: 48,
          color: Colors.white,
        );
      default:
        return Icon(
          Icons.campaign,
          size: 48,
          color: Colors.white,
        );
    }
  }

  void _changeProfilePhoto() {
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
              'Change Profile Photo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPhotoOption(
                  'Meeting',
                  Icons.campaign,
                  Color(0xFF4CAF50),
                  'meeting',
                ),
                _buildPhotoOption(
                  'User',
                  Icons.person,
                  Color(0xFF1976D2),
                  'user',
                ),
                _buildPhotoOption(
                  'Camera',
                  Icons.camera_alt,
                  Color(0xFFFF5722),
                  'camera',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Photo change is handled by individual option taps
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1976D2),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Done'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoOption(String label, IconData icon, Color color, String type) {
    bool isSelected = _profileImageType == type;
    return GestureDetector(
      onTap: () {
        setState(() {
          _profileImageType = type;
        });
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, color.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(12),
              border: isSelected ? Border.all(color: Colors.black87, width: 3) : null,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black87 : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
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
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? Colors.red : Color(0xFF1976D2),
          size: 24,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isLogout ? Colors.red : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 16,
        ),
        onTap: () {
          if (isLogout) {
            // Handle logout - navigate back to login screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else {
            // Handle other menu items
            // Add specific navigation logic for each menu item here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title clicked'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }
}
