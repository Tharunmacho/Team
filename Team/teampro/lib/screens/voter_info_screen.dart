import 'package:flutter/material.dart';

class VoterInfoScreen extends StatefulWidget {
  final Map<String, dynamic> voterData;
  
  const VoterInfoScreen({super.key, required this.voterData});

  @override
  State<VoterInfoScreen> createState() => _VoterInfoScreenState();
}

class _VoterInfoScreenState extends State<VoterInfoScreen> with TickerProviderStateMixin {
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
                        color: Colors.white.withOpacity(0.3),
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
            
            const SizedBox(height: 16),
            
            // Voter card section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
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
              child: Column(
                children: [
                  // Header with serial, section, part
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        color: Colors.pink,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Serial : ${widget.voterData['serialNo']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Section : ${widget.voterData['section'] ?? '1'}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Part : ${widget.voterData['partNumber']}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1976D2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Voter details row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile image with camera icon
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.image,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF1976D2),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    widget.voterData['voterId'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Camera icon
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
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(width: 16),
                      
                      // Voter information
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.voterData['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              widget.voterData['tamilName'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              widget.voterData['fatherName'],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              widget.voterData['fatherTamilName'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              widget.voterData['doorNo'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Age and relation row
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.voterData['age']}',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.voterData['relation'],
                        style: TextStyle(
                          fontSize: 16,
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
                  _buildTab('Basic', 0, Icons.person_outline),
                  _buildTab('Family', 1, Icons.family_restroom),
                  _buildTab('Share', 2, Icons.share_outlined),
                  _buildTab('Friends', 3, Icons.people_outline),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildBasicTab(),
                  _buildFamilyTab(),
                  _buildShareTab(),
                  _buildFriendsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index, IconData icon) {
    bool isSelected = _tabController.index == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _tabController.animateTo(index);
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.symmetric(vertical: 12),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
            
            // Caste dropdown
            _buildDropdownField(
              icon: Icons.people_outlined,
              value: selectedCaste,
              items: ['Select Caste', 'Vanniyar', 'Mudaliar', 'Pillai', 'Naidu', 'Reddy', 'Chettiar', 'Gounder', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedCaste = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Sub-Caste dropdown
            _buildDropdownField(
              icon: Icons.group_outlined,
              value: selectedSubCaste,
              items: ['Select Sub-Caste', 'Agamudayar', 'Kallar', 'Maravar', 'Thevar', 'Nadar', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedSubCaste = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Party dropdown
            _buildDropdownField(
              icon: Icons.how_to_vote_outlined,
              value: selectedParty,
              items: ['Select Party', 'ADMK', 'DMK', 'BJP', 'Congress', 'PMK', 'MDMK', 'VCK', 'AMMK', 'NTK', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedParty = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Category dropdown
            _buildDropdownField(
              icon: Icons.label_outlined,
              value: selectedCategory,
              items: ['Select Category', 'Active', 'Inactive', 'New', 'Shifted', 'Deleted', 'Pending'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Schemes dropdown
            _buildDropdownField(
              icon: Icons.card_giftcard_outlined,
              value: selectedSchemes,
              items: ['Select Schemes', 'Ration Card', 'Pension', 'Housing', 'Education', 'Healthcare', 'Employment', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedSchemes = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Language dropdown
            _buildDropdownField(
              icon: Icons.language_outlined,
              value: selectedLanguage,
              items: ['Select Language', 'Tamil', 'English', 'Hindi', 'Telugu', 'Malayalam', 'Kannada', 'Other'],
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  _checkForChanges();
                });
              },
            ),
            
            const SizedBox(height: 16),
            
            // Feedback text field
            _buildTextField(
              icon: Icons.feedback_outlined,
              hint: 'Feedback',
              controller: _feedbackController,
              onChanged: (value) => _checkForChanges(),
            ),
            
            const SizedBox(height: 16),
            
            // Aadhar text field
            _buildTextField(
              icon: Icons.credit_card_outlined,
              hint: 'Aadhar Number',
              controller: _aadharController,
              onChanged: (value) => _checkForChanges(),
            ),
            
            const SizedBox(height: 16),
            
            // PAN text field
            _buildTextField(
              icon: Icons.account_balance_wallet_outlined,
              hint: 'PAN Number',
              controller: _panController,
              onChanged: (value) => _checkForChanges(),
            ),
            
            const SizedBox(height: 16),
            
            // Membership text field
            _buildTextField(
              icon: Icons.card_membership_outlined,
              hint: 'Membership Details',
              controller: _membershipController,
              onChanged: (value) => _checkForChanges(),
            ),
            
            const SizedBox(height: 16),
            
            // Remarks text field
            _buildTextField(
              icon: Icons.note_outlined,
              hint: 'Remarks',
              controller: _remarksController,
              maxLines: 3,
              onChanged: (value) => _checkForChanges(),
            ),
            
            const SizedBox(height: 24),
            
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
      padding: EdgeInsets.symmetric(horizontal: 16),
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
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.tune,
                  color: Colors.grey[600],
                  size: 20,
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 40),
          
          // No family members found section
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
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
                    textAlign: TextAlign.center,
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
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Voter card preview
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Voter photo
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
                      
                      const SizedBox(width: 16),
                      
                      // Voter details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.voterData['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'EPIC: ${widget.voterData['epicId']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'Age: ${widget.voterData['age']} | ${widget.voterData['relation']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'Part: ${widget.voterData['part']} | Serial: ${widget.voterData['serial']}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Share options
            Text(
              'Share Voter Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Share buttons grid
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildShareOption(
                  icon: Icons.message,
                  label: 'WhatsApp',
                  color: Colors.green,
                  onTap: () => _shareViaWhatsApp(),
                ),
                _buildShareOption(
                  icon: Icons.sms,
                  label: 'SMS',
                  color: Colors.blue,
                  onTap: () => _shareViaSMS(),
                ),
                _buildShareOption(
                  icon: Icons.share,
                  label: 'Share',
                  color: Colors.orange,
                  onTap: () => _shareGeneral(),
                ),
                _buildShareOption(
                  icon: Icons.print,
                  label: 'Take Print',
                  color: Colors.purple,
                  onTap: () => _takePrint(),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            // Additional sharing options
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Share Options',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Share with details toggle
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: Color(0xFF1976D2),
                      ),
                      Text('Include personal details'),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: Color(0xFF1976D2),
                      ),
                      Text('Include contact information'),
                    ],
                  ),
                  
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: Color(0xFF1976D2),
                      ),
                      Text('Include voting history'),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendsTab() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          'Friends Information\nComing Soon!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  // Helper methods for Basic tab
  Widget _buildDropdownField({
    required IconData icon,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF1976D2)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String hint,
    required TextEditingController controller,
    required Function(String) onChanged,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF1976D2)),
          hintText: hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
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
        _feedbackController.text.isNotEmpty ||
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
    // Simulate update process
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Voter information updated successfully!'),
        backgroundColor: Colors.green,
      ),
    );
    
    // Reset changes flag
    setState(() {
      hasChanges = false;
    });
  }

  // Helper methods for Share tab
  Widget _buildShareOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareViaWhatsApp() {
    String message = _generateShareMessage();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening WhatsApp to share voter information...'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _shareViaSMS() {
    String message = _generateShareMessage();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening SMS to share voter information...'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _shareGeneral() {
    String message = _generateShareMessage();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening share dialog...'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  void _takePrint() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Preparing voter information for printing...'),
        backgroundColor: Colors.purple,
      ),
    );
  }

  String _generateShareMessage() {
    return '''
Voter Information:
Name: ${widget.voterData['name']}
EPIC ID: ${widget.voterData['epicId']}
Age: ${widget.voterData['age']}
Relation: ${widget.voterData['relation']}
Part: ${widget.voterData['part']}
Serial: ${widget.voterData['serial']}
Door No: ${widget.voterData['doorNo']}
    ''';
  }
}
