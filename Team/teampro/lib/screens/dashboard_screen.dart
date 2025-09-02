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
import 'guardian_screen.dart';
import 'birthday_screen.dart';
import 'overseas_screen.dart';
import 'star_screen.dart';
import 'mobile_screen.dart';
import 'above80_screen.dart';
import 'my_cadre_screen.dart';
import 'part_map_screen.dart';
import 'voter_list_screen.dart';
import 'voter_part_numbers_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Election dropdown state
  String selectedElection = '119 - Thondamuthur';
  List<String> electionOptions = [
    '119 - Thondamuthur',
    '120 - Annur',
    '121 - Avinashi',
    '122 - Tirupur North',
    '123 - Tirupur South',
    '124 - Kangeyam',
    '125 - Perundurai',
    '126 - Bhavani',
    '127 - Anthiyur',
    '128 - Gobichettipalayam',
    '129 - Bhavanisagar',
    '130 - Erode East',
    '131 - Erode West',
    '132 - Modakurichi',
    '133 - Kavundampalayam',
    '134 - Erode North',
    '135 - Coimbatore North',
    '136 - Coimbatore South',
  ];
  
  // Advanced search controllers
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _partNoController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _epicIdController = TextEditingController();
  final TextEditingController _voterFirstNameController = TextEditingController();
  final TextEditingController _voterLastNameController = TextEditingController();
  final TextEditingController _relationFirstNameController = TextEditingController();
  final TextEditingController _relationLastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF5F7FA),
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
                    onTap: () => _showCustomDrawer(),
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
                              selectedElection,
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
                          GestureDetector(
                            onTap: _showAdvancedSearch,
                            child: Container(
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
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyCadreScreen()),
                                    );
                                  },
                                  child: _buildStatCard(
                                    'Total\nCadres',
                                    '0',
                                    Color(0xFF1976D2),
                                    Icons.directions_walk,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyCadreScreen()),
                                    );
                                  },
                                  child: _buildStatCard(
                                    'Cadre\nActive',
                                    '0',
                                    Color(0xFF4CAF50),
                                    null,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => MyCadreScreen()),
                                    );
                                  },
                                  child: _buildStatCard(
                                    'Cadre\nInActive',
                                    '0',
                                    Color(0xFFF44336),
                                    null,
                                  ),
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
              MaterialPageRoute(builder: (context) => MyCadreScreen()),
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
            MaterialPageRoute(builder: (context) => MyCadreScreen()),
          );
        } else if (title == 'Voter') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VoterPartNumbersScreen()),
          );
        } else if (title == 'New') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewVotersScreen()),
          );
        } else if (title == 'Part') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PartMapScreen()),
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
        } else if (title == 'Guardian') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GuardianScreen()),
          );
        } else if (title == 'Birthday') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BirthdayScreen()),
          );
        } else if (title == 'Overseas') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OverseasScreen()),
          );
        } else if (title == 'Star') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StarScreen()),
          );
        } else if (title == 'Mobile') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MobileScreen()),
          );
        } else if (title == '80 Above') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Above80Screen()),
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
    String tempSelectedElection = selectedElection;
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) => Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
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
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: tempSelectedElection,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    ),
                    items: electionOptions.map((String election) {
                      return DropdownMenuItem<String>(
                        value: election,
                        child: Text(
                          election,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setModalState(() {
                        tempSelectedElection = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedElection = tempSelectedElection;
                      });
                      Navigator.pop(context);
                      _showMessage('Election updated to $tempSelectedElection');
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

  void _showCustomDrawer() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: animation.drive(
            Tween(begin: Offset(-1.0, 0.0), end: Offset.zero).chain(
              CurveTween(curve: Curves.easeInOut),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: SafeArea(
                  child: Column(
                    children: [
                      // Header section with curved background design
                      Container(
                        height: 340,
                        child: Stack(
                          children: [
                            // Main curved background container
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFFF5E9A3), // Yellow gradient top
                                    Color(0xFFE8F4FD), // Light blue gradient bottom
                                  ],
                                ),
                              ),
                            ),
                            // Curved white overlay for design effect
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
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
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black87,
                                  size: 28,
                                ),
                              ),
                            ),
                            // Profile content
                            Positioned(
                              top: 70,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  // Profile image with political meeting photo
                                  Container(
                                    width: 120,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        'assets/images/political_meeting.jpg',
                                        width: 120,
                                        height: 80,
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
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
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
                                  const SizedBox(height: 8),
                                  // Role
                                  Text(
                                    'Super Admin',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // Action buttons row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _buildActionButton(Icons.list_alt, 'Overview'),
                                      const SizedBox(width: 16),
                                      _buildActionButton(Icons.home, 'Home'),
                                      const SizedBox(width: 16),
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
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          child: Column(
                            children: [
                              _buildFullPageMenuItem(Icons.person_outline, 'My Profile'),
                              _buildFullPageMenuItem(Icons.how_to_vote_outlined, 'Your Elections'),
                              _buildFullPageMenuItem(Icons.settings_outlined, 'Settings'),
                              _buildFullPageMenuItem(Icons.language_outlined, 'App Language'),
                              _buildFullPageMenuItem(Icons.lock_outline, 'Change Password'),
                              _buildFullPageMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
                              _buildFullPageMenuItem(Icons.description_outlined, 'Terms & Conditions'),
                              _buildFullPageMenuItem(Icons.help_outline, 'Help'),
                              _buildFullPageMenuItem(Icons.info_outline, 'About'),
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
              ),
            ),
          ),
        );
      },
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

  Widget _buildFullPageMenuItem(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.pop(context); // Close overlay first
          if (title == 'My Profile') {
            // Navigate to profile screen for all menu items
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else {
            // Handle other menu items
            _showMessage('$title feature coming soon!');
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color(0xFF1976D2),
                size: 24,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAdvancedSearch() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Advance Search',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 24),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildSearchField('Mobile No', _mobileController),
              const SizedBox(height: 16),
              _buildSearchField('PartNo', _partNoController),
              const SizedBox(height: 16),
              _buildSearchField('Serial No', _serialNoController),
              const SizedBox(height: 16),
              _buildSearchField('EPIC Id', _epicIdController),
              const SizedBox(height: 16),
              _buildSearchField('Voter First Name', _voterFirstNameController),
              const SizedBox(height: 16),
              _buildSearchField('Voter Last Name', _voterLastNameController),
              const SizedBox(height: 16),
              _buildSearchField('Relation First Name', _relationFirstNameController),
              const SizedBox(height: 16),
              _buildSearchField('Relation Last Name', _relationLastNameController),
              const SizedBox(height: 16),
              _buildSearchField('Age', _ageController),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey[700],
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Search functionality implemented!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1976D2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Search'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF1976D2)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    _mobileController.dispose();
    _partNoController.dispose();
    _serialNoController.dispose();
    _epicIdController.dispose();
    _voterFirstNameController.dispose();
    _voterLastNameController.dispose();
    _relationFirstNameController.dispose();
    _relationLastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}
