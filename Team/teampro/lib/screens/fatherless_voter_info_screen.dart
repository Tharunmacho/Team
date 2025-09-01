import 'package:flutter/material.dart';
import 'fatherless_screen.dart';

class FatherlessVoterInfoScreen extends StatefulWidget {
  final FatherlessVoter voter;
  
  const FatherlessVoterInfoScreen({super.key, required this.voter});

  @override
  State<FatherlessVoterInfoScreen> createState() => _FatherlessVoterInfoScreenState();
}

class _FatherlessVoterInfoScreenState extends State<FatherlessVoterInfoScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _aadharController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _membershipController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  
  String selectedFeedback = 'Feedback';
  String selectedCasteCategory = 'Caste Category';
  String selectedCaste = 'Select Caste';
  String selectedSubCaste = 'Select Sub-Caste';
  String selectedParty = 'Select Party';
  String selectedCategory = 'Select Category';
  String selectedSchemes = 'Select Schemes';
  String selectedLanguage = 'Select Language';
  
  bool hasChanges = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1); // Start with Family tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _feedbackController.dispose();
    _aadharController.dispose();
    _panController.dispose();
    _membershipController.dispose();
    _remarksController.dispose();
    super.dispose();
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
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                        size: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Voter Info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                  ), // Spacer to center the title
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Voter info card
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
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
                  // Serial, Section, Part info
                  Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        color: Colors.pink,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Serial : ${widget.voter.serialNo}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Section : 1',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Part : 1',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Row(
                    children: [
                      // Profile image section
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color(0xFF1976D2),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  widget.voter.voterId,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
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
                      ),
                      
                      const SizedBox(width: 16),
                      
                      // Voter details section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.voter.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              widget.voter.tamilName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.voter.location,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              widget.voter.tamilLocation,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Door No ${widget.voter.doorNo}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Bottom section with age and relation
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person,
                              size: 16,
                              color: Colors.orange[700],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.voter.age}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.voter.relation,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Tabs section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: _buildTab('Basic', 0, Icons.description_outlined)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTab('Family', 1, Icons.family_restroom)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTab('Share', 2, Icons.share)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildTab('Friends', 3, Icons.group)),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Tab content
            Expanded(
              child: _buildTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index, IconData icon) {
    bool isSelected = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController.animateTo(index);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF1976D2) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color(0xFF1976D2) : Colors.grey[300]!,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_tabController.index) {
      case 0: // Basic
        return _buildBasicTab();
      case 1: // Family
        return _buildFamilyTab();
      case 2: // Share
        return _buildShareTab();
      case 3: // Friends
        return _buildFriendsTab();
      default:
        return _buildFamilyTab();
    }
  }

  Widget _buildBasicTab() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Caste Category dropdown
            _buildDropdownField(
              icon: Icons.category_outlined,
              value: selectedCasteCategory,
              items: ['Caste Category', 'General', 'OBC', 'SC', 'ST'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedCasteCategory = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Select Caste dropdown
            _buildDropdownField(
              icon: Icons.people_outline,
              value: selectedCaste,
              items: ['Select Caste', 'Brahmin', 'Kshatriya', 'Vaishya', 'Shudra', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedCaste = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Select Sub-Caste dropdown
            _buildDropdownField(
              icon: Icons.group_outlined,
              value: selectedSubCaste,
              items: ['Select Sub-Caste', 'Sub-Caste 1', 'Sub-Caste 2', 'Sub-Caste 3'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedSubCaste = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Select Party dropdown
            _buildDropdownField(
              icon: Icons.flag_outlined,
              value: selectedParty,
              items: ['Select Party', 'BJP', 'Congress', 'AAP', 'DMK', 'AIADMK', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedParty = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Select Category dropdown
            _buildDropdownField(
              icon: Icons.category,
              value: selectedCategory,
              items: ['Select Category', 'Category 1', 'Category 2', 'Category 3'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Select Schemes dropdown
            _buildDropdownField(
              icon: Icons.schema_outlined,
              value: selectedSchemes,
              items: ['Select Schemes', 'Scheme 1', 'Scheme 2', 'Scheme 3'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedSchemes = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Select Language dropdown
            _buildDropdownField(
              icon: Icons.language_outlined,
              value: selectedLanguage,
              items: ['Select Language', 'Tamil', 'English', 'Hindi', 'Telugu', 'Malayalam'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Feedback dropdown
            _buildDropdownField(
              icon: Icons.feedback_outlined,
              value: selectedFeedback,
              items: ['Feedback', 'Positive', 'Negative', 'Neutral'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedFeedback = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Aadhar Number
            _buildInputField(
              icon: Icons.credit_card,
              child: TextField(
                controller: _aadharController,
                onChanged: (value) => _checkForChanges(),
                decoration: InputDecoration(
                  hintText: 'Enter Aadhar Number',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // PAN Number
            _buildInputField(
              icon: Icons.account_balance_wallet,
              child: TextField(
                controller: _panController,
                onChanged: (value) => _checkForChanges(),
                decoration: InputDecoration(
                  hintText: 'Enter Pan Number',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Membership Number
            _buildInputField(
              icon: Icons.card_membership,
              child: TextField(
                controller: _membershipController,
                onChanged: (value) => _checkForChanges(),
                decoration: InputDecoration(
                  hintText: 'Enter Membership Number',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Remarks
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: _remarksController,
                onChanged: (value) => _checkForChanges(),
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter Remarks',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Dynamic button (No Changes / Update)
            GestureDetector(
              onTap: hasChanges ? _updateVoterInfo : null,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: hasChanges ? Color(0xFF1976D2) : Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  hasChanges ? 'UPDATE' : 'NO CHANGES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyTab() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Search section
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by EPIC number or name',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color(0xFF1976D2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 40),
          
          // No family members found
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_off,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No family members found',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Search by EPIC number to add family members',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareTab() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Age and relation info
          Container(
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
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person,
                        size: 16,
                        color: Colors.orange[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.voter.age}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  widget.voter.relation,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Share options
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareOption(
                  'WhatsApp',
                  Icons.message,
                  Colors.green,
                  () => _shareVia('WhatsApp'),
                ),
                _buildShareOption(
                  'SMS',
                  Icons.sms,
                  Colors.blue,
                  () => _shareVia('SMS'),
                ),
                _buildShareOption(
                  'Share',
                  Icons.share,
                  Colors.blue[700]!,
                  () => _shareVia('Share'),
                ),
                _buildShareOption(
                  'Take Print',
                  Icons.print,
                  Colors.grey[600]!,
                  () => _shareVia('Print'),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Part & Section Info
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Part & Section Info',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Info cards
                  _buildInfoCard(
                    '1 - Panchayat Union Ele. School,Thaliyur',
                    '1 - ஊராட்சி ஒன்றிய ஆரம்ப பள்ளி,தாளியூர்',
                  ),
                  
                  const SizedBox(height: 16),
                  
                  _buildInfoCard(
                    '1 - டிடிஎஸ் திப்பையா வீதி வார்டு எண் 1',
                    '1 - TTS THIPPAIA ST WARD NO. 1',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendsTab() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.group_off,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No friends found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Icon(
              icon,
              color: Colors.grey[600],
              size: 20,
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required IconData icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Icon(
              icon,
              color: Colors.grey[600],
              size: 20,
            ),
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              initialValue: value,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              ),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: item == value && items.indexOf(item) == 0 
                          ? Colors.grey[400] 
                          : Colors.black87,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShareOption(String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle) {
    return Container(
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
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF1976D2),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  void _checkForChanges() {
    bool newHasChanges = 
        selectedCasteCategory != 'Caste Category' ||
        selectedCaste != 'Select Caste' ||
        selectedSubCaste != 'Select Sub-Caste' ||
        selectedParty != 'Select Party' ||
        selectedCategory != 'Select Category' ||
        selectedSchemes != 'Select Schemes' ||
        selectedLanguage != 'Select Language' ||
        selectedFeedback != 'Feedback' ||
        _aadharController.text.isNotEmpty ||
        _panController.text.isNotEmpty ||
        _membershipController.text.isNotEmpty ||
        _remarksController.text.isNotEmpty;
    
    if (newHasChanges != hasChanges) {
      setState(() {
        hasChanges = newHasChanges;
      });
    }
  }

  void _updateVoterInfo() {
    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text('Voter information updated successfully!'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
    
    // Reset the changes flag
    setState(() {
      hasChanges = false;
    });
  }

  void _shareVia(String method) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sharing voter info via $method...'),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
