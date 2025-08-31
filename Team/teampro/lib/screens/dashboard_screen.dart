import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart';
import 'cadre_manager_screen.dart';
import 'part_numbers_screen.dart';
import 'family_manager_screen.dart';
import 'survey_screen.dart';
import 'catalogue_screen.dart';
import 'slip_box_screen.dart';
import 'poll_day_screen.dart';
import 'notifications_screen.dart';
import 'transgender_screen.dart';
import 'fatherless_screen.dart';
import 'new_voters_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      drawer: _buildNavigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Menu icon
                  GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Icon(
                      Icons.menu,
                      size: 28,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Location dropdown
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showElectionModal(),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '119 - Thondamuthur',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Notification icon
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Search section
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: 'Voter Id or Voter Name',
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 16,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey[600],
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Icon(
                              Icons.tune,
                              color: Colors.grey[600],
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Manager cards section (like Image 2)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildManagerCard('Cadre\nManager', Icons.person_outline),
                          const SizedBox(width: 12),
                          _buildManagerCard('Voter\nManager', Icons.how_to_vote_outlined),
                          const SizedBox(width: 12),
                          _buildManagerCard('Family\nManager', Icons.family_restroom_outlined),
                          const SizedBox(width: 12),
                          _buildManagerCard('Survey\nManager', Icons.assignment_outlined),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Category grid section
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: [
                          _buildCategoryItem('Cadre', Icons.person_pin_circle_outlined, Color(0xFF2196F3)),
                          _buildCategoryItem('Part', Icons.location_on_outlined, Color(0xFFF44336)),
                          _buildCategoryItem('Voter', Icons.home_outlined, Color(0xFFFF9800)),
                          _buildCategoryItem('New', Icons.people_outline, Color(0xFF4CAF50)),
                          _buildCategoryItem('Transgender', Icons.person_outline, Color(0xFFFFEB3B)),
                          _buildCategoryItem('Fatherless', Icons.person_off_outlined, Color(0xFF9C27B0)),
                          _buildCategoryItem('Guardian', Icons.security_outlined, Color(0xFF00BCD4)),
                          _buildCategoryItem('Overseas', Icons.public_outlined, Color(0xFF607D8B)),
                          _buildCategoryItem('Birthday', Icons.cake_outlined, Color(0xFFE91E63)),
                          _buildCategoryItem('Star', Icons.star_outline, Color(0xFFFF5722)),
                          _buildCategoryItem('Mobile', Icons.phone_android_outlined, Color(0xFF3F51B5)),
                          _buildCategoryItem('80 Above', Icons.elderly_outlined, Color(0xFF795548)),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Image carousel section
                    Container(
                      height: 200,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF1976D2),
                                  Color(0xFF42A5F5),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.campaign,
                                    size: 48,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Political Meeting',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 48,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Community Event',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Page indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == 0 ? Color(0xFF1976D2) : Colors.grey[300],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == 1 ? Color(0xFF1976D2) : Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Cadre Overview section
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cadre Overview',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  'Total\nCadres',
                                  '0',
                                  Color(0xFF1976D2),
                                  Icons.directions_walk,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildStatCard(
                                  'Cadre\nActive',
                                  '0',
                                  Color(0xFF4CAF50),
                                  null,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildStatCard(
                                  'Cadre\nInActive',
                                  '0',
                                  Color(0xFFF44336),
                                  null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(child: Container()), // Empty space
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildStatCard(
                                  'Logged\nIn',
                                  '0',
                                  Color(0xFF4CAF50),
                                  null,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildStatCard(
                                  'Not\nLogged',
                                  '0',
                                  Color(0xFFF44336),
                                  null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            
            // Bottom navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBottomNavItem('Report', Icons.trending_up_outlined),
                  _buildBottomNavItem('Catalogue', Icons.list_alt_outlined),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF1976D2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  _buildBottomNavItem('Slip Box', Icons.inventory_outlined),
                  _buildBottomNavItem('Poll Day', Icons.how_to_vote_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManagerCard(String title, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (title == 'Cadre\nManager') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CadreManagerScreen()),
            );
          } else if (title == 'Voter\nManager') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PartNumbersScreen()),
            );
          } else if (title == 'Family\nManager') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FamilyManagerScreen()),
            );
          } else if (title == 'Survey\nManager') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SurveyScreen()),
            );
          } else {
            // Show coming soon message for other managers
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title - Coming Soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Color(0xFF1976D2), width: 1.5),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 32,
                color: Color(0xFF1976D2),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle navigation for different categories
        if (title == 'Cadre') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadreManagerScreen()),
          );
        } else if (title == 'Voter') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartNumbersScreen()),
          );
        } else if (title == 'New') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewVotersScreen()),
          );
        } else if (title == 'Part') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FamilyManagerScreen()),
          );
        } else if (title == 'Transgender') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransgenderScreen()),
          );
        } else if (title == 'Fatherless') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FatherlessScreen()),
          );
        } else {
          // Show coming soon message for other categories
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title - Coming Soon!'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color, IconData? icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
          ],
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Catalogue') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CatalogueScreen()),
          );
        } else if (title == 'Slip Box') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SlipBoxScreen()),
          );
        } else if (title == 'Poll Day') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PollDayScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$title - Coming Soon!'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.black54,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  void _showElectionModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
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
              Text(
                'Set Default Election',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  '119 - Thondamuthur',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _showMessage('Election updated successfully');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1976D2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'UPDATE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'CLOSE',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF1976D2),
      ),
    );
  }

  Widget _buildNavigationDrawer() {
    return Drawer(
      child: Container(
        color: Color(0xFFF5F7FA),
        child: Column(
          children: [
            // Profile section with curved background
            Container(
              height: 280,
              child: Stack(
                children: [
                  // Curved background
                  Container(
                    height: 240,
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
                    top: 40,
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
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        // Profile image with political meeting background
                        Container(
                          width: 120,
                          height: 80,
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
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // User name
                        Text(
                          'ramachandran ...',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Role
                        Text(
                          'Super Admin',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Action buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildActionButton(Icons.list_alt, 'Overview'),
                            const SizedBox(width: 20),
                            _buildActionButton(Icons.home, 'Home'),
                            const SizedBox(width: 20),
                            _buildActionButton(Icons.camera_alt, 'Camera'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu items
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                ],
              ),
            ),
            
            // Version info
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'V.3.1 | 21-May-2025',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.black87,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
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
        onTap: () {
          if (isLogout) {
            // Handle logout - navigate back to login screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else {
            // Navigate to profile screen for all menu items
            Navigator.pop(context); // Close drawer first
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
