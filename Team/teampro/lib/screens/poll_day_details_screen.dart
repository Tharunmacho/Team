import 'package:flutter/material.dart';

class PollDayDetailsScreen extends StatefulWidget {
  final int partNumber;
  
  const PollDayDetailsScreen({super.key, required this.partNumber});

  @override
  State<PollDayDetailsScreen> createState() => _PollDayDetailsScreenState();
}

class _PollDayDetailsScreenState extends State<PollDayDetailsScreen> {
  final TextEditingController _searchController = TextEditingController();
  Map<int, bool> _votingStatus = {}; // Track voting status for each booth
  int _votedCount = 2;
  int _notVotedCount = 1453;
  int _totalCount = 1455;

  @override
  void initState() {
    super.initState();
    // Initialize voting status - some booths already voted (green), others not voted (red)
    _initializeVotingStatus();
  }

  void _initializeVotingStatus() {
    // Initialize voting status based on your image
    // Booths 7 and 8 are green (voted), others are red (not voted)
    for (int i = 5; i <= 42; i++) {
      if (i == 7 || i == 8) {
        _votingStatus[i] = true; // Voted
      } else {
        _votingStatus[i] = false; // Not voted
      }
    }
  }

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
                        'Poll day - Part ${widget.partNumber}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.black87,
                    size: 24,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Search section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF1976D2),
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Statistics section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard('Voted : $_votedCount', Colors.green),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard('Not Voted :\n$_notVotedCount', Colors.pink),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard('Total : $_totalCount', Colors.lightBlue),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Booth numbers grid
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.0,
                  ),
                  itemCount: 38, // Booths 5-42
                  itemBuilder: (context, index) {
                    int boothNumber = index + 5; // Start from booth 5
                    bool isVoted = _votingStatus[boothNumber] ?? false;
                    
                    return _buildBoothCard(boothNumber, isVoted);
                  },
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
                  _buildBottomNavItem('Slip Box', Icons.inventory_outlined, false),
                  _buildBottomNavItem('Poll Day', Icons.how_to_vote_outlined, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: color == Colors.lightBlue ? Color(0xFF1976D2) : color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBoothCard(int boothNumber, bool isVoted) {
    return GestureDetector(
      onTap: () => _toggleVotingStatus(boothNumber),
      child: Container(
        decoration: BoxDecoration(
          color: isVoted ? Colors.green.withOpacity(0.1) : Colors.pink.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isVoted ? Colors.green : Colors.pink,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            boothNumber.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isVoted ? Colors.green[700] : Colors.pink[700],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleVotingStatus(int boothNumber) {
    setState(() {
      bool currentStatus = _votingStatus[boothNumber] ?? false;
      _votingStatus[boothNumber] = !currentStatus;
      
      // Update counts
      if (!currentStatus) {
        // Changed from not voted to voted
        _votedCount++;
        _notVotedCount--;
      } else {
        // Changed from voted to not voted
        _votedCount--;
        _notVotedCount++;
      }
    });
    
    // Show success notification
    _showSuccessNotification(boothNumber, _votingStatus[boothNumber]!);
  }

  void _showSuccessNotification(int boothNumber, bool isVoted) {
    // Show bottom notification like in your image
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF1976D2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.how_to_vote,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Voted status updated\nsuccessfully',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                boothNumber.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[800],
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(
          bottom: 80, // Above bottom navigation
          left: 16,
          right: 16,
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
