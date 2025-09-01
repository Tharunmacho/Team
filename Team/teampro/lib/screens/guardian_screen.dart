import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'voter_info_screen.dart';
import 'phone_call_screen.dart';

class GuardianScreen extends StatefulWidget {
  const GuardianScreen({super.key});

  @override
  State<GuardianScreen> createState() => _GuardianScreenState();
}

class _GuardianScreenState extends State<GuardianScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _partNoController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _epicIdController = TextEditingController();
  final TextEditingController _voterFirstNameController = TextEditingController();
  final TextEditingController _voterLastNameController = TextEditingController();
  final TextEditingController _relationFirstNameController = TextEditingController();
  
  // Filter state variables
  double minAge = 18;
  double maxAge = 120;
  Set<String> selectedGenders = {};
  Set<String> selectedVoterHistory = {};
  Set<String> selectedVoterCategory = {};
  Set<String> selectedPoliticalParty = {};
  Set<String> selectedReligion = {};

  // Sample guardian voters data
  final List<GuardianVoter> voters = [
    GuardianVoter(
      serialNo: 224,
      name: 'ponnammal',
      tamilName: 'பொன்னம்மாள்',
      relation: 'ramachandra',
      tamilRelation: 'ரமாசந்திரா',
      voterId: 'RIV2345114',
      doorNo: 'Door No 15/A 14',
      age: 89,
      gender: 'Other',
      mobileNumber: '9876543210',
      politicalParty: 'DMK',
      religion: 'Hindu',
      voterCategory: 'Active',
      location: 'Thondamuthur',
      tamilLocation: 'தொண்டமுத்தூர்',
    ),
    GuardianVoter(
      serialNo: 260,
      name: 'venkatakrishnan.k.s venkat',
      tamilName: 'வெங்கடகிருஷ்ணன்...',
      relation: 'mangala krishnan mangala',
      tamilRelation: 'மங்கள கிருஷ்ணன்',
      voterId: 'RIV2456789',
      doorNo: 'Door No 12/B 8',
      age: 67,
      gender: 'Male',
      mobileNumber: '9123456789',
      politicalParty: 'ADMK',
      religion: 'Hindu',
      voterCategory: 'Active',
      location: 'Thondamuthur',
      tamilLocation: 'தொண்டமுத்தூர்',
    ),
    GuardianVoter(
      serialNo: 125,
      name: 'lakshmi',
      tamilName: 'லக்ஷ்மி',
      relation: 'kumar',
      tamilRelation: 'குமார்',
      voterId: 'RIV3789456',
      doorNo: 'Door No 8/C 12',
      age: 45,
      gender: 'Female',
      mobileNumber: '9987654321',
      politicalParty: 'BJP',
      religion: 'Hindu',
      voterCategory: 'Active',
      location: 'Thondamuthur',
      tamilLocation: 'தொண்டமுத்தூர்',
    ),
    GuardianVoter(
      serialNo: 78,
      name: 'rajesh',
      tamilName: 'ராஜேஷ்',
      relation: 'priya',
      tamilRelation: 'பிரியா',
      voterId: 'RIV4567890',
      doorNo: 'Door No 3/A 7',
      age: 52,
      gender: 'Male',
      mobileNumber: '9654321876',
      politicalParty: 'Congress',
      religion: 'Christian',
      voterCategory: 'Inactive',
      location: 'Thondamuthur',
      tamilLocation: 'தொண்டமுத்தூர்',
    ),
  ];

  List<GuardianVoter> filteredVoters = [];

  @override
  void initState() {
    super.initState();
    filteredVoters = voters;
  }

  void _filterVoters(String query) {
    setState(() {
      filteredVoters = _applyAllFilters(query);
    });
  }

  List<GuardianVoter> _applyAllFilters([String? searchQuery]) {
    List<GuardianVoter> result = List.from(voters);

    // Apply search query filter
    if (searchQuery != null && searchQuery.isNotEmpty) {
      result = result.where((voter) =>
        voter.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
        voter.voterId.toLowerCase().contains(searchQuery.toLowerCase()) ||
        voter.serialNo.toString().contains(searchQuery) ||
        voter.mobileNumber.contains(searchQuery) ||
        voter.doorNo.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }

    // Apply age filter
    result = result.where((voter) => 
      voter.age >= minAge && voter.age <= maxAge
    ).toList();

    // Apply gender filter
    if (selectedGenders.isNotEmpty) {
      result = result.where((voter) => 
        selectedGenders.contains(voter.gender)
      ).toList();
    }

    // Apply political party filter
    if (selectedPoliticalParty.isNotEmpty) {
      result = result.where((voter) => 
        selectedPoliticalParty.contains(voter.politicalParty)
      ).toList();
    }

    // Apply religion filter
    if (selectedReligion.isNotEmpty) {
      result = result.where((voter) => 
        selectedReligion.contains(voter.religion)
      ).toList();
    }

    // Apply voter category filter
    if (selectedVoterCategory.isNotEmpty) {
      result = result.where((voter) => 
        selectedVoterCategory.contains(voter.voterCategory)
      ).toList();
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Container(
              padding: EdgeInsets.all(16),
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
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _showCustomDrawer(),
                        child: Icon(
                          Icons.menu,
                          size: 28,
                          color: Colors.black87,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Guardian',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFF1976D2),
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: _showAdvancedSearch,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child: Text(
                                'Voter Id or Voter Name',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Demographics section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: _buildDemographicCard(
                      'Male',
                      '1648',
                      Color(0xFFE8F5E8),
                      Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDemographicCard(
                      'Female',
                      '773',
                      Color(0xFFFFEBEE),
                      Color(0xFFE91E63),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDemographicCard(
                      'Others',
                      '6',
                      Color(0xFFF3E5F5),
                      Color(0xFF9C27B0),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDemographicCard(
                      'Total',
                      '2427',
                      Color(0xFFE3F2FD),
                      Color(0xFF2196F3),
                    ),
                  ),
                ],
              ),
            ),
            
            // Voters list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: filteredVoters.length,
                itemBuilder: (context, index) {
                  final voter = filteredVoters[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: _buildVoterCard(voter),
                  );
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
              color: Colors.black.withOpacity(0.1),
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title + ':',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVoterCard(GuardianVoter voter) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
      child: Row(
        children: [
          // Profile image placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                // Image placeholder
                Center(
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Color(0xFF2196F3),
                  ),
                ),
                // Edit icon overlay
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xFF2196F3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          
          // Voter information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Serial number with star
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 16,
                      color: Color(0xFF2196F3),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Serial No: ${voter.serialNo}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2196F3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Name in English and Tamil
                Text(
                  voter.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  voter.tamilName,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                
                // Relation in English and Tamil
                Text(
                  voter.relation,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  voter.tamilRelation,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Door number
                Text(
                  voter.doorNo,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Right side - actions and info
          Column(
            children: [
              // Voter ID
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  voter.voterId,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              // Age and gender
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 16,
                    color: Color(0xFFE91E63),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${voter.age}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    voter.gender,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Action buttons
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneCallScreen(
                            voterName: voter.name,
                            voterTamilName: voter.tamilName,
                            phoneNumber: voter.mobileNumber,
                            voterId: voter.voterId,
                            doorNo: voter.doorNo,
                            age: voter.age,
                            gender: voter.gender,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.phone,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle voter details - convert GuardianVoter to VoterInfoScreen format
                      Map<String, dynamic> voterData = {
                        'serialNo': voter.serialNo,
                        'section': '1',
                        'partNumber': '119',
                        'name': voter.name,
                        'tamilName': voter.tamilName,
                        'fatherName': voter.relation,
                        'fatherTamilName': voter.tamilRelation,
                        'voterId': voter.voterId,
                        'doorNo': voter.doorNo,
                        'age': voter.age,
                        'relation': voter.gender,
                        'epicId': voter.voterId,
                        'part': '119',
                        'serial': voter.serialNo,
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
                        color: Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.info,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle family details
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.family_restroom,
                            size: 16,
                            color: Colors.white,
                          ),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildBottomNavItem(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle navigation
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

  // Phone call functionality
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch phone dialer'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Advanced search modal
  void _showAdvancedSearch() {
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
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Advanced Search',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Search voters using multiple criteria',
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildSearchField('Mobile Number', Icons.phone, _mobileController),
                    const SizedBox(height: 16),
                    _buildSearchField('Part Number', Icons.location_on, _partNoController),
                    const SizedBox(height: 16),
                    _buildSearchField('Serial Number', Icons.numbers, _serialNoController),
                    const SizedBox(height: 16),
                    _buildSearchField('EPIC ID', Icons.credit_card, _epicIdController),
                    const SizedBox(height: 16),
                    _buildSearchField('Voter First Name', Icons.person, _voterFirstNameController),
                    const SizedBox(height: 16),
                    _buildSearchField('Voter Last Name', Icons.person_outline, _voterLastNameController),
                    const SizedBox(height: 16),
                    _buildSearchField('Relation First Name', Icons.family_restroom, _relationFirstNameController),
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
                        _clearSearchFields();
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey[400]!),
                      ),
                      child: Text(
                        'CLEAR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _performAdvancedSearch();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1976D2),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'SEARCH',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(String label, IconData icon, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color(0xFF1976D2)),
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
    setState(() {
      filteredVoters = voters;
    });
  }

  void _performAdvancedSearch() {
    setState(() {
      filteredVoters = voters.where((voter) {
        bool matches = true;
        
        if (_mobileController.text.isNotEmpty) {
          matches = matches && voter.mobileNumber.contains(_mobileController.text);
        }
        if (_partNoController.text.isNotEmpty) {
          matches = matches && voter.location.toLowerCase().contains(_partNoController.text.toLowerCase());
        }
        if (_serialNoController.text.isNotEmpty) {
          matches = matches && voter.serialNo.toString().contains(_serialNoController.text);
        }
        if (_epicIdController.text.isNotEmpty) {
          matches = matches && voter.voterId.toLowerCase().contains(_epicIdController.text.toLowerCase());
        }
        if (_voterFirstNameController.text.isNotEmpty) {
          matches = matches && voter.name.toLowerCase().contains(_voterFirstNameController.text.toLowerCase());
        }
        if (_voterLastNameController.text.isNotEmpty) {
          matches = matches && voter.name.toLowerCase().contains(_voterLastNameController.text.toLowerCase());
        }
        if (_relationFirstNameController.text.isNotEmpty) {
          matches = matches && voter.relation.toLowerCase().contains(_relationFirstNameController.text.toLowerCase());
        }
        
        return matches;
      }).toList();
    });
  }

  // Filter modal functionality
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
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                          _clearAllFilters();
                          setModalState(() {});
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: Colors.grey[400]!),
                        ),
                        child: Text(
                          'CLEAR ALL',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _applyFilters();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1976D2),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          'APPLY FILTERS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAgeFilter(StateSetter setModalState) {
    return Column(
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
    );
  }

  Widget _buildGenderFilter(StateSetter setModalState) {
    return Column(
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
            _buildFilterChip('Other', Icons.transgender, Colors.orange, setModalState, selectedGenders),
          ],
        ),
      ],
    );
  }

  Widget _buildPoliticalPartyFilter(StateSetter setModalState) {
    return Column(
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
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildFilterChip('DMK', Icons.how_to_vote, Colors.red, setModalState, selectedPoliticalParty),
            _buildFilterChip('ADMK', Icons.how_to_vote, Colors.green, setModalState, selectedPoliticalParty),
            _buildFilterChip('BJP', Icons.how_to_vote, Colors.orange, setModalState, selectedPoliticalParty),
            _buildFilterChip('Congress', Icons.how_to_vote, Colors.blue, setModalState, selectedPoliticalParty),
            _buildFilterChip('PMK', Icons.how_to_vote, Colors.purple, setModalState, selectedPoliticalParty),
          ],
        ),
      ],
    );
  }

  Widget _buildReligionFilter(StateSetter setModalState) {
    return Column(
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
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildFilterChip('Hindu', Icons.temple_hindu, Colors.orange, setModalState, selectedReligion),
            _buildFilterChip('Christian', Icons.church, Colors.blue, setModalState, selectedReligion),
            _buildFilterChip('Muslim', Icons.mosque, Colors.green, setModalState, selectedReligion),
            _buildFilterChip('Others', Icons.diversity_3, Colors.purple, setModalState, selectedReligion),
          ],
        ),
      ],
    );
  }

  Widget _buildVoterCategoryFilter(StateSetter setModalState) {
    return Column(
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
        Row(
          children: [
            _buildFilterChip('Active', Icons.check_circle, Colors.green, setModalState, selectedVoterCategory),
            const SizedBox(width: 16),
            _buildFilterChip('Inactive', Icons.cancel, Colors.red, setModalState, selectedVoterCategory),
          ],
        ),
      ],
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
          color: isSelected ? color.withOpacity(0.2) : Colors.grey[100],
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
    setState(() {
      minAge = 18;
      maxAge = 120;
      selectedGenders.clear();
      selectedVoterHistory.clear();
      selectedVoterCategory.clear();
      selectedPoliticalParty.clear();
      selectedReligion.clear();
      filteredVoters = voters;
    });
  }

  void _applyFilters() {
    setState(() {
      filteredVoters = _applyAllFilters();
    });
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title - Feature coming soon!'),
                backgroundColor: Color(0xFF1976D2),
              ),
            );
          } else {
            // Handle other menu items
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
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Close drawer
                Navigator.pop(context); // Go back to previous screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logged out successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
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

class GuardianVoter {
  final int serialNo;
  final String name;
  final String tamilName;
  final String relation;
  final String tamilRelation;
  final String voterId;
  final String doorNo;
  final int age;
  final String gender;
  final String mobileNumber;
  final String politicalParty;
  final String religion;
  final String voterCategory;
  final String location;
  final String tamilLocation;

  GuardianVoter({
    required this.serialNo,
    required this.name,
    required this.tamilName,
    required this.relation,
    required this.tamilRelation,
    required this.voterId,
    required this.doorNo,
    required this.age,
    required this.gender,
    required this.mobileNumber,
    required this.politicalParty,
    required this.religion,
    required this.voterCategory,
    required this.location,
    required this.tamilLocation,
  });
}
