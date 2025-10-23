// lib/features/home/presentation/pages/home_screen_api_section.dart
part of '../../home_screen.dart';

extension HomeScreenAPISection on HomeScreenState {
  Widget _buildApiTestSection(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtils.w(16)),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(MediaQueryUtils.r(12)),
        border: Border.all(color: Colors.blue),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.api, color: Colors.blue),
              SizedBox(width: MediaQueryUtils.w(8)),
              Text(
                "API INTEGRATION FOR PROFILE",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[700],
                  fontSize: MediaQueryUtils.sp(14),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQueryUtils.h(12)),
          
          _isLoadingApi
              ? _buildShimmerLoadingState()
              : Column(
                  children: [
                    Text(
                      "Tap below to view the profile",
                      style: GoogleFonts.poppins(
                        fontSize: MediaQueryUtils.sp(12),
                        color: Colors.blue[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQueryUtils.h(12)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _testUsersApi(context, ref),
                          child: Text('PROFILE'),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoadingState() {
    return ShimmerWidget(
      baseColor: Colors.blue[100]!,
      highlightColor: Colors.blue[50]!,
      child: Column(
        children: [
          ShimmerLine(width: MediaQueryUtils.w(250), height: 12),
          SizedBox(height: MediaQueryUtils.h(8)),
          ShimmerLine(width: MediaQueryUtils.w(200), height: 12),
          SizedBox(height: MediaQueryUtils.h(16)),
          ShimmerBox(
            width: MediaQueryUtils.w(140),
            height: MediaQueryUtils.h(40),
            borderRadius: BorderRadius.circular(8),
          ),
          SizedBox(height: MediaQueryUtils.h(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
                ),
              ),
              SizedBox(width: MediaQueryUtils.w(8)),
              Text(
                'Loading API data...',
                style: GoogleFonts.poppins(
                  fontSize: MediaQueryUtils.sp(11),
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _testUsersApi(BuildContext context, WidgetRef ref) async {
    setState(() {
      _isLoadingApi = true;
    });

    final repository = ref.read(userRepositoryProvider);
    final result = await repository.fetchUser();
    
    setState(() {
      _isLoadingApi = false;
    });

    result.match(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(' Users API Error: $error'),
            backgroundColor: Colors.red,
          ),
        );
      },
      (user) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('✅ Users API Success!'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('User data from API response:'),
                SizedBox(height: 16),
                Text('Name: ${user.name}'),
                Text('Email: ${user.email}'),
                Text('Location: ${user.location}'),
                Text('ID: ${user.id}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}