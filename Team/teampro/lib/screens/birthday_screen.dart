import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'voter_info_screen.dart';

class BirthdayVoter {
  final int serialNo;
  final String name;
  final String tamilName;
  final String location;
  final String tamilLocation;
  final String voterId;
  final String doorNo;
  final int age;
  final String relation;
  final String gender;
  final String mobileNumber;
  final String politicalParty;
  final String religion;
  final String voterCategory;
  final DateTime birthDate;

  BirthdayVoter({
    required this.serialNo,
    required this.name,
    required this.tamilName,
    required this.location,
    required this.tamilLocation,
    required this.voterId,
    required this.doorNo,
    required this.age,
    required this.relation,
    required this.gender,
    required this.mobileNumber,
    required this.politicalParty,
    required this.religion,
    required this.voterCategory,
    required this.birthDate,
  });
}

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _partNoController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _epicIdController = TextEditingController();
  final TextEditingController _voterFirstNameController = TextEditingController();
  final TextEditingController _voterLastNameController = TextEditingController();
  final TextEditingController _relationFirstNameController = TextEditingController();
  
  DateTime selectedDate = DateTime.now();
  String selectedDateFilter = 'Today'; // 'Today', 'Tomorrow', 'Both'
  DateTime? customSelectedDate;
  String selectedMonth = 'All';
  bool showUpcomingBirthdays = false;
  int upcomingDays = 7; // Show birthdays in next 7 days
  String selectedAgeGroup = 'All'; // 'All', '18-30', '31-50', '51+'
  
  // Filter state variables
  double minAge = 18;
  double maxAge = 120;
  Set<String> selectedGenders = {};
  Set<String> selectedVoterHistory = {};
  Set<String> selectedVoterCategory = {};
  Set<String> selectedPoliticalParty = {};
  Set<String> selectedReligion = {};

  final List<BirthdayVoter> allVoters = [
    BirthdayVoter(
      serialNo: 424,
      name: 'manikandan',
      tamilName: 'மணிகண்டன்',
      location: 'padmanathan',
      tamilLocation: 'பத்மநாதன்',
      voterId: 'RIV1048222',
      doorNo: '95-15',
      age: 29,
      relation: 'Father',
      gender: 'Male',
      mobileNumber: '+91 9876543210',
      politicalParty: 'DMK',
      religion: 'Hindu',
      voterCategory: 'General',
      birthDate: DateTime.now(), // Today's birthday
    ),
    BirthdayVoter(
      serialNo: 364,
      name: 'shantha',
      tamilName: 'சாந்தா',
      location: 'krishnan street',
      tamilLocation: 'கிருஷ்ணன் தெரு',
      voterId: 'RIV2347865',
      doorNo: '12-A',
      age: 45,
      relation: 'Mother',
      gender: 'Female',
      mobileNumber: '+91 8765432109',
      politicalParty: 'AIADMK',
      religion: 'Hindu',
      voterCategory: 'General',
      birthDate: DateTime.now().add(Duration(days: 1)), // Tomorrow's birthday
    ),
    BirthdayVoter(
      serialNo: 156,
      name: 'rajesh kumar',
      tamilName: 'ராஜேஷ் குமார்',
      location: 'gandhi nagar',
      tamilLocation: 'காந்தி நகர்',
      voterId: 'RIV9876543',
      doorNo: '78-B',
      age: 35,
      relation: 'Father',
      gender: 'Male',
      mobileNumber: '+91 7654321098',
      politicalParty: 'BJP',
      religion: 'Hindu',
      voterCategory: 'OBC',
      birthDate: DateTime.now(), // Today's birthday
    ),
  ];

  List<BirthdayVoter> filteredVoters = [];

  @override
  void initState() {
    super.initState();
    filteredVoters = allVoters;
    _applyDateFilter();
  }

  void _applyDateFilter() {
    setState(() {
      DateTime today = DateTime.now();
      DateTime tomorrow = today.add(Duration(days: 1));
      
      filteredVoters = allVoters.where((voter) {
        bool matchesDate = false;
        
        if (selectedDateFilter == 'Today') {
          matchesDate = _isSameDay(voter.birthDate, today);
        } else if (selectedDateFilter == 'Tomorrow') {
          matchesDate = _isSameDay(voter.birthDate, tomorrow);
        } else if (selectedDateFilter == 'Both') {
          matchesDate = _isSameDay(voter.birthDate, today) || 
                       _isSameDay(voter.birthDate, tomorrow);
        }
        
        return matchesDate && _applyAllFilters(voter);
      }).toList();
    });
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day && date1.month == date2.month;
  }

  bool _applyAllFilters(BirthdayVoter voter) {
    // Age filter
    if (voter.age < minAge || voter.age > maxAge) return false;
    
    // Gender filter
    if (selectedGenders.isNotEmpty && !selectedGenders.contains(voter.gender)) return false;
    
    // Political party filter
    if (selectedPoliticalParty.isNotEmpty && !selectedPoliticalParty.contains(voter.politicalParty)) return false;
    
    // Religion filter
    if (selectedReligion.isNotEmpty && !selectedReligion.contains(voter.religion)) return false;
    
    // Voter category filter
    if (selectedVoterCategory.isNotEmpty && !selectedVoterCategory.contains(voter.voterCategory)) return false;
    
    return true;
  }

  @override
  Widget build(BuildContext context) {
    int maleCount = filteredVoters.where((v) => v.gender == 'Male').length;
    int femaleCount = filteredVoters.where((v) => v.gender == 'Female').length;
    int othersCount = filteredVoters.where((v) => v.gender == 'Others').length;
    int totalCount = filteredVoters.length;

    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          size: 28,
                          color: Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Birthday',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _showDatePicker,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFF1976D2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: _showFilterModal,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Icon(
                            Icons.tune,
                            color: Colors.blue[600],
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Voter Id or Voter Name',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        prefixIcon: Icon(Icons.search, color: Colors.blue[600]),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      onTap: _showAdvancedSearch,
                      onChanged: (value) {
                        // Implement search functionality
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Demographics section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _buildDemographicCard('Male:', maleCount.toString(), Colors.green[200]!, Colors.green[800]!),
                  const SizedBox(width: 8),
                  _buildDemographicCard('Female:', femaleCount.toString(), Colors.pink[200]!, Colors.pink[800]!),
                  const SizedBox(width: 8),
                  _buildDemographicCard('Others:', othersCount.toString(), Colors.grey[300]!, Colors.grey[800]!),
                  const SizedBox(width: 8),
                  _buildDemographicCard('Total:', totalCount.toString(), Colors.blue[200]!, Colors.blue[800]!),
                ],
              ),
            ),

            // Voter list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: filteredVoters.length,
                itemBuilder: (context, index) {
                  final voter = filteredVoters[index];
                  return _buildVoterCard(voter);
                },
              ),
            ),
          ],
        ),
      ),
      
      // Bottom navigation
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
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
    );
  }

  Widget _buildDemographicCard(String title, String value, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoterCard(BirthdayVoter voter) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Serial number header with star
          Row(
            children: [
              Icon(
                Icons.star_border,
                color: Colors.pink,
                size: 16,
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: _showAdvancedSearch,
                child: Text(
                  'Serial No: ${voter.serialNo}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              // Voter ID badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Color(0xFF1976D2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  voter.voterId,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image section
              Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              
              // Voter details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _showAdvancedSearch,
                      child: Text(
                        voter.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      voter.tamilName,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      voter.location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      voter.tamilLocation,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Door No ${voter.doorNo}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // Bottom section with age and action buttons
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      size: 14,
                      color: Colors.pink[600],
                    ),
                    const SizedBox(width: 3),
                    Text(
                      '${voter.age}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.pink[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                voter.relation,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              Spacer(),
              // Action icons at bottom right
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => _makePhoneCall(voter.mobileNumber),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.phone, color: Colors.white, size: 16),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle birthday celebration
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.cake, color: Colors.white, size: 16),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Map<String, dynamic> voterData = {
                        'serialNo': voter.serialNo,
                        'serial': voter.serialNo.toString(),
                        'name': voter.name,
                        'tamilName': voter.tamilName,
                        'fatherName': voter.location,
                        'fatherTamilName': voter.tamilLocation,
                        'location': voter.location,
                        'tamilLocation': voter.tamilLocation,
                        'voterId': voter.voterId,
                        'doorNo': voter.doorNo,
                        'partNumber': '1',
                        'section': '1',
                        'age': voter.age,
                        'gender': voter.gender,
                        'relation': voter.relation,
                        'mobileNumber': voter.mobileNumber,
                        'politicalParty': voter.politicalParty,
                        'religion': voter.religion,
                        'voterCategory': voter.voterCategory,
                      };
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VoterInfoScreen(voterData: voterData),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF1976D2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.family_restroom, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }



  Widget _buildCompactActionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.black54,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String title, IconData icon) {
    return Column(
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
    );
  }

  void _showDatePicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Header with close button
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                        children: [
                          Text(
                    'Birthday Calendar',
                            style: TextStyle(
                      fontSize: 20,
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
                    ),
                    
                    Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick date filters
                    _buildQuickFilters(),
                    const SizedBox(height: 24),
                    
                    // Month selector
                    _buildMonthSelector(),
                    const SizedBox(height: 24),
                    
                    // Age group filter
                    _buildAgeGroupFilter(),
                    const SizedBox(height: 24),
                    
                    // Upcoming birthdays toggle
                    _buildUpcomingBirthdaysToggle(),
                    const SizedBox(height: 24),
                    
                    // Calendar grid
                    _buildCalendarGrid(),
                    const SizedBox(height: 24),
                    
                    // Birthday statistics
                    _buildBirthdayStatistics(),
                    const SizedBox(height: 24),
                    
                    // Action buttons
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateFilterButton(String title) {
    bool isSelected = selectedDateFilter == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedDateFilter = title;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1976D2) : Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Filter Voters',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select filters to narrow down the voter list',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Age filter
                      _buildAgeFilter(setModalState),
                      const SizedBox(height: 30),
                      
                      // Gender filter
                      _buildGenderFilter(setModalState),
                      const SizedBox(height: 30),
                      
                      // Political Party filter
                      _buildPoliticalPartyFilter(setModalState),
                      const SizedBox(height: 30),
                      
                      // Religion filter
                      _buildReligionFilter(setModalState),
                      const SizedBox(height: 30),
                      
                      // Voter Category filter
                      _buildVoterCategoryFilter(setModalState),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setModalState(() {
                            _clearAllFilters();
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Clear All',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _applyDateFilter();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1976D2),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Apply Filters',
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
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgeFilter(StateSetter setModalState) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Age',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text('Age 18'),
              Spacer(),
              Text('Age 120'),
            ],
          ),
          RangeSlider(
            values: RangeValues(minAge, maxAge),
            min: 0,
            max: 120,
            divisions: 120,
            labels: RangeLabels(
              minAge.round().toString(),
              maxAge.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setModalState(() {
                minAge = values.start;
                maxAge = values.end;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGenderFilter(StateSetter setModalState) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildFilterChip('Male', Icons.person, Colors.blue, setModalState, selectedGenders),
              const SizedBox(width: 16),
              _buildFilterChip('Female', Icons.person, Colors.pink, setModalState, selectedGenders),
              const SizedBox(width: 16),
              _buildFilterChip('Others', Icons.transgender, Colors.orange, setModalState, selectedGenders),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPoliticalPartyFilter(StateSetter setModalState) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Political Party',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildFilterChip('DMK', Icons.flag, Colors.red, setModalState, selectedPoliticalParty),
              _buildFilterChip('AIADMK', Icons.flag, Colors.green, setModalState, selectedPoliticalParty),
              _buildFilterChip('BJP', Icons.flag, Colors.orange, setModalState, selectedPoliticalParty),
              _buildFilterChip('Congress', Icons.flag, Colors.blue, setModalState, selectedPoliticalParty),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReligionFilter(StateSetter setModalState) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Religion',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildFilterChip('Hindu', Icons.temple_hindu, Colors.orange, setModalState, selectedReligion),
              _buildFilterChip('Muslim', Icons.mosque, Colors.green, setModalState, selectedReligion),
              _buildFilterChip('Christian', Icons.church, Colors.purple, setModalState, selectedReligion),
              _buildFilterChip('Others', Icons.diversity_3, Colors.grey, setModalState, selectedReligion),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoterCategoryFilter(StateSetter setModalState) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Voter Category',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildFilterChip('General', Icons.person, Colors.blue, setModalState, selectedVoterCategory),
              _buildFilterChip('OBC', Icons.group, Colors.green, setModalState, selectedVoterCategory),
              _buildFilterChip('SC', Icons.accessibility, Colors.orange, setModalState, selectedVoterCategory),
              _buildFilterChip('ST', Icons.nature_people, Colors.brown, setModalState, selectedVoterCategory),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon, Color color, StateSetter setModalState, Set<String> selectedSet) {
    bool isSelected = selectedSet.contains(label);
    return GestureDetector(
      onTap: () {
        setModalState(() {
          if (isSelected) {
            selectedSet.remove(label);
          } else {
            selectedSet.add(label);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.2) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey[300]!,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? color : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearAllFilters() {
    minAge = 18;
    maxAge = 120;
    selectedGenders.clear();
    selectedVoterHistory.clear();
    selectedVoterCategory.clear();
    selectedPoliticalParty.clear();
    selectedReligion.clear();
  }

  void _showAdvancedSearch() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.9,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Advance Search',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 28),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSearchField('Mobile No', _mobileController),
                      const SizedBox(height: 20),
                      _buildSearchField('PartNo', _partNoController),
                      const SizedBox(height: 20),
                      _buildSearchField('Serial No', _serialNoController),
                      const SizedBox(height: 20),
                      _buildSearchField('EPIC Id', _epicIdController),
                      const SizedBox(height: 20),
                      _buildSearchField('Voter First Name', _voterFirstNameController),
                      const SizedBox(height: 20),
                      _buildSearchField('Voter Last Name', _voterLastNameController),
                      const SizedBox(height: 20),
                      _buildSearchField('Relation First Name', _relationFirstNameController),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _clearSearchFields();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Apply search logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1976D2),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
    );
  }

  Widget _buildSearchField(String hint, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  void _clearSearchFields() {
    _mobileController.clear();
    _partNoController.clear();
    _serialNoController.clear();
    _epicIdController.clear();
    _voterFirstNameController.clear();
    _voterLastNameController.clear();
    _relationFirstNameController.clear();
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    try {
      if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not launch phone app'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error making phone call: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  // Enhanced calendar helper methods
  Widget _buildQuickFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Filters',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildDateFilterChip('Today'),
            _buildDateFilterChip('Tomorrow'),
            _buildDateFilterChip('This Week'),
            _buildDateFilterChip('This Month'),
            _buildDateFilterChip('Custom'),
          ],
        ),
      ],
    );
  }

  Widget _buildDateFilterChip(String label) {
    bool isSelected = selectedDateFilter == label;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedDateFilter = label;
          if (label == 'Custom') {
            _showCustomDatePicker();
          }
        });
      },
      selectedColor: Color(0xFF1976D2).withOpacity(0.2),
      checkmarkColor: Color(0xFF1976D2),
    );
  }

  Widget _buildMonthSelector() {
    List<String> months = [
      'All', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter by Month',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: months.length,
            itemBuilder: (context, index) {
              String month = months[index];
              bool isSelected = selectedMonth == month;
              return Container(
                margin: EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(month),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      selectedMonth = month;
                    });
                  },
                  selectedColor: Color(0xFF1976D2).withOpacity(0.2),
                  checkmarkColor: Color(0xFF1976D2),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAgeGroupFilter() {
    List<String> ageGroups = ['All', '18-30', '31-50', '51-70', '70+'];
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Age Groups',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ageGroups.map((group) {
            bool isSelected = selectedAgeGroup == group;
            return FilterChip(
              label: Text(group),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  selectedAgeGroup = group;
                });
              },
              selectedColor: Color(0xFF1976D2).withOpacity(0.2),
              checkmarkColor: Color(0xFF1976D2),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildUpcomingBirthdaysToggle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Birthdays',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Switch(
              value: showUpcomingBirthdays,
              onChanged: (value) {
                setState(() {
                  showUpcomingBirthdays = value;
                });
              },
              activeColor: Color(0xFF1976D2),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Show birthdays in next $upcomingDays days',
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
        if (showUpcomingBirthdays) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              Text('Days: ', style: TextStyle(fontSize: 14)),
              Expanded(
                child: Slider(
                  value: upcomingDays.toDouble(),
                  min: 1,
                  max: 30,
                  divisions: 29,
                  label: upcomingDays.toString(),
                  onChanged: (value) {
                    setState(() {
                      upcomingDays = value.round();
                    });
                  },
                  activeColor: Color(0xFF1976D2),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildCalendarGrid() {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    int daysInMonth = lastDayOfMonth.day;
    int startWeekday = firstDayOfMonth.weekday % 7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Calendar - ${_getMonthName(now.month)} ${now.year}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        
        // Weekday headers
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            List<String> weekdays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
            return Container(
              alignment: Alignment.center,
              child: Text(
                weekdays[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
            );
          },
        ),
        
        // Calendar days
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1.0,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemCount: 42, // 6 weeks
          itemBuilder: (context, index) {
            int dayNumber = index - startWeekday + 1;
            bool isCurrentMonth = dayNumber > 0 && dayNumber <= daysInMonth;
            bool isToday = isCurrentMonth && dayNumber == now.day;
            bool hasBirthday = isCurrentMonth && _hasBirthdayOnDay(dayNumber);
            
            return GestureDetector(
              onTap: isCurrentMonth ? () {
                setState(() {
                  customSelectedDate = DateTime(now.year, now.month, dayNumber);
                  selectedDateFilter = 'Custom';
                });
              } : null,
              child: Container(
                decoration: BoxDecoration(
                  color: isToday 
                      ? Color(0xFF1976D2)
                      : hasBirthday 
                          ? Colors.pink[100]
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: customSelectedDate != null && 
                          customSelectedDate!.day == dayNumber &&
                          customSelectedDate!.month == now.month
                      ? Border.all(color: Color(0xFF1976D2), width: 2)
                      : null,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        isCurrentMonth ? dayNumber.toString() : '',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isToday 
                              ? Colors.white
                              : isCurrentMonth 
                                  ? Colors.black87
                                  : Colors.grey[400],
                        ),
                      ),
                    ),
                    if (hasBirthday)
                      Positioned(
                        top: 2,
                        right: 2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBirthdayStatistics() {
    int todayBirthdays = _getBirthdaysForDay(DateTime.now()).length;
    int tomorrowBirthdays = _getBirthdaysForDay(DateTime.now().add(Duration(days: 1))).length;
    int thisWeekBirthdays = _getBirthdaysForWeek().length;
    int thisMonthBirthdays = _getBirthdaysForMonth().length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birthday Statistics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildStatItem('Today', todayBirthdays, Colors.blue)),
                  Expanded(child: _buildStatItem('Tomorrow', tomorrowBirthdays, Colors.green)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildStatItem('This Week', thisWeekBirthdays, Colors.orange)),
                  Expanded(child: _buildStatItem('This Month', thisMonthBirthdays, Colors.purple)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  _exportBirthdays();
                },
                icon: Icon(Icons.file_download),
                label: Text('Export'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Color(0xFF1976D2)),
                  foregroundColor: Color(0xFF1976D2),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  _setReminders();
                },
                icon: Icon(Icons.notifications),
                label: Text('Reminders'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.orange),
                  foregroundColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _applyAdvancedFilters();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1976D2),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Apply Filters',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper methods for calendar functionality
  String _getMonthName(int month) {
    List<String> monthNames = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month];
  }

  bool _hasBirthdayOnDay(int day) {
    DateTime checkDate = DateTime(DateTime.now().year, DateTime.now().month, day);
    return allVoters.any((voter) => 
      voter.birthDate.day == day && voter.birthDate.month == checkDate.month);
  }

  List<BirthdayVoter> _getBirthdaysForDay(DateTime date) {
    return allVoters.where((voter) => 
      voter.birthDate.day == date.day && voter.birthDate.month == date.month).toList();
  }

  List<BirthdayVoter> _getBirthdaysForWeek() {
    DateTime now = DateTime.now();
    DateTime weekStart = now.subtract(Duration(days: now.weekday - 1));
    DateTime weekEnd = weekStart.add(Duration(days: 6));
    
    return allVoters.where((voter) {
      DateTime thisYearBirthday = DateTime(now.year, voter.birthDate.month, voter.birthDate.day);
      return thisYearBirthday.isAfter(weekStart.subtract(Duration(days: 1))) &&
             thisYearBirthday.isBefore(weekEnd.add(Duration(days: 1)));
    }).toList();
  }

  List<BirthdayVoter> _getBirthdaysForMonth() {
    DateTime now = DateTime.now();
    return allVoters.where((voter) => voter.birthDate.month == now.month).toList();
  }

  void _showCustomDatePicker() {
    showDatePicker(
      context: context,
      initialDate: customSelectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          customSelectedDate = pickedDate;
        });
      }
    });
  }

  void _applyAdvancedFilters() {
    setState(() {
      DateTime now = DateTime.now();
      
      filteredVoters = allVoters.where((voter) {
        // Date filter
        bool matchesDate = true;
        if (selectedDateFilter == 'Today') {
          matchesDate = _isSameDay(voter.birthDate, now);
        } else if (selectedDateFilter == 'Tomorrow') {
          matchesDate = _isSameDay(voter.birthDate, now.add(Duration(days: 1)));
        } else if (selectedDateFilter == 'This Week') {
          DateTime weekStart = now.subtract(Duration(days: now.weekday - 1));
          DateTime weekEnd = weekStart.add(Duration(days: 6));
          DateTime thisYearBirthday = DateTime(now.year, voter.birthDate.month, voter.birthDate.day);
          matchesDate = thisYearBirthday.isAfter(weekStart.subtract(Duration(days: 1))) &&
                       thisYearBirthday.isBefore(weekEnd.add(Duration(days: 1)));
        } else if (selectedDateFilter == 'This Month') {
          matchesDate = voter.birthDate.month == now.month;
        } else if (selectedDateFilter == 'Custom' && customSelectedDate != null) {
          matchesDate = _isSameDay(voter.birthDate, customSelectedDate!);
        }
        
        // Month filter
        bool matchesMonth = selectedMonth == 'All' || 
                           _getMonthName(voter.birthDate.month) == selectedMonth;
        
        // Age group filter
        bool matchesAgeGroup = true;
        if (selectedAgeGroup != 'All') {
          switch (selectedAgeGroup) {
            case '18-30':
              matchesAgeGroup = voter.age >= 18 && voter.age <= 30;
              break;
            case '31-50':
              matchesAgeGroup = voter.age >= 31 && voter.age <= 50;
              break;
            case '51-70':
              matchesAgeGroup = voter.age >= 51 && voter.age <= 70;
              break;
            case '70+':
              matchesAgeGroup = voter.age > 70;
              break;
          }
        }
        
        // Upcoming birthdays
        bool matchesUpcoming = true;
        if (showUpcomingBirthdays) {
          DateTime thisYearBirthday = DateTime(now.year, voter.birthDate.month, voter.birthDate.day);
          if (thisYearBirthday.isBefore(now)) {
            thisYearBirthday = DateTime(now.year + 1, voter.birthDate.month, voter.birthDate.day);
          }
          int daysDifference = thisYearBirthday.difference(now).inDays;
          matchesUpcoming = daysDifference <= upcomingDays;
        }
        
        return matchesDate && matchesMonth && matchesAgeGroup && matchesUpcoming && _applyAllFilters(voter);
      }).toList();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Advanced filters applied! Found ${filteredVoters.length} results.')),
    );
  }

  void _exportBirthdays() {
    // Export functionality
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Export Birthday List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.picture_as_pdf, color: Colors.red),
              title: Text('Export as PDF'),
              subtitle: Text('${filteredVoters.length} birthdays'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('PDF export started...')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.table_chart, color: Colors.green),
              title: Text('Export as Excel'),
              subtitle: Text('${filteredVoters.length} birthdays'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Excel export started...')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.blue),
              title: Text('Share List'),
              subtitle: Text('Share birthday information'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sharing options opened...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _setReminders() {
    // Reminder functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Birthday Reminders'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Set reminders for upcoming birthdays?'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Daily reminders enabled!')),
                      );
                    },
                    child: Text('Daily'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Weekly reminders enabled!')),
                      );
                    },
                    child: Text('Weekly'),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _mobileController.dispose();
    _partNoController.dispose();
    _serialNoController.dispose();
    _epicIdController.dispose();
    _voterFirstNameController.dispose();
    _voterLastNameController.dispose();
    _relationFirstNameController.dispose();
    super.dispose();
  }
}



