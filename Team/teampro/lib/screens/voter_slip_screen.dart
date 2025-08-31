import 'package:flutter/material.dart';

class VoterSlipScreen extends StatefulWidget {
  const VoterSlipScreen({super.key});

  @override
  State<VoterSlipScreen> createState() => _VoterSlipScreenState();
}

class _VoterSlipScreenState extends State<VoterSlipScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isVoterSlipSelected = true;
  bool _defaultPrintEnabled = false;
  bool _defaultCandidateEnabled = false;
  bool _thondamuthurPrintEnabled = true;
  bool _thondamuthurCandidateEnabled = true;

  @override
  void dispose() {
    _searchController.dispose();
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
                        'Slip Box',
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
            
            const SizedBox(height: 30),
            
            // Toggle buttons section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFF1976D2),
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isVoterSlipSelected = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: !_isVoterSlipSelected 
                              ? Color(0xFF1976D2) 
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Slip Box',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: !_isVoterSlipSelected 
                                ? Colors.white 
                                : Color(0xFF1976D2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: _isVoterSlipSelected 
                            ? Color(0xFF1976D2) 
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Voter Slip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _isVoterSlipSelected 
                              ? Colors.white 
                              : Color(0xFF1976D2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Search section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
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
                        hintText: 'Enter Voter Slip Name',
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
            
            const SizedBox(height: 30),
            
            // Content section
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // Default section
                    _buildSlipSection(
                      'Default',
                      _defaultPrintEnabled,
                      _defaultCandidateEnabled,
                      (printValue) {
                        setState(() {
                          _defaultPrintEnabled = printValue;
                        });
                      },
                      (candidateValue) {
                        setState(() {
                          _defaultCandidateEnabled = candidateValue;
                        });
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Thondamuthur4 section with preview
                    _buildThondamuthurSection(),
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
                  _buildBottomNavItem('Report', Icons.trending_up_outlined, false),
                  _buildBottomNavItem('Catalogue', Icons.list_alt_outlined, false),
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
                  _buildBottomNavItem('Slip Box', Icons.inventory_outlined, true),
                  _buildBottomNavItem('Poll Day', Icons.how_to_vote_outlined, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlipSection(
    String title,
    bool printEnabled,
    bool candidateEnabled,
    ValueChanged<bool> onPrintChanged,
    ValueChanged<bool> onCandidateChanged,
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          
          const SizedBox(height: 20),
          
          Row(
            children: [
              // Print toggle
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Print',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildToggleSwitch(printEnabled, onPrintChanged),
                  ],
                ),
              ),
              
              const SizedBox(width: 40),
              
              // Candidate toggle
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Candidate',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildToggleSwitch(candidateEnabled, onCandidateChanged),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThondamuthurSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thondamuthur4',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          
          const SizedBox(height: 20),
          
          Row(
            children: [
              // Print toggle
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Print',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildToggleSwitch(_thondamuthurPrintEnabled, (value) {
                      setState(() {
                        _thondamuthurPrintEnabled = value;
                      });
                    }),
                  ],
                ),
              ),
              
              const SizedBox(width: 40),
              
              // Candidate toggle
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Candidate',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildToggleSwitch(_thondamuthurCandidateEnabled, (value) {
                      setState(() {
                        _thondamuthurCandidateEnabled = value;
                      });
                    }),
                  ],
                ),
              ),
              
              const SizedBox(width: 20),
              
              // Preview image section
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Mock slip preview with Tamil text
                    Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header with symbols
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.account_circle, size: 12, color: Colors.black54),
                                Icon(Icons.how_to_vote, size: 12, color: Colors.black54),
                              ],
                            ),
                            const SizedBox(height: 2),
                            // Tamil text simulation
                            Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 50,
                              height: 2,
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 40,
                              height: 2,
                              color: Colors.black54,
                            ),
                            const SizedBox(height: 4),
                            // More content lines
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.black38,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 60,
                              height: 1,
                              color: Colors.black38,
                            ),
                            const SizedBox(height: 2),
                            Container(
                              width: 45,
                              height: 1,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSwitch(bool isEnabled, ValueChanged<bool> onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!isEnabled),
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isEnabled ? Colors.green : Colors.red,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: isEnabled ? 30 : 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isEnabled ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String title, IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: isSelected ? Color(0xFF1976D2) : Colors.black54,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? Color(0xFF1976D2) : Colors.black54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}