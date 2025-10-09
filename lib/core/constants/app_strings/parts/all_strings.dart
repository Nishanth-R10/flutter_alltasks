part of '../default_string.dart';


extension AllStrings on DefaultString {
  // Home Screen Strings
  String get userType => _getString(I18nKeys.userType, fallback: 'User Type:');
  String get newUser => _getString(I18nKeys.newUser, fallback: 'New User');
  String get returningUser => _getString(I18nKeys.returningUser, fallback: 'Returning User');
  String get navigateToFeatures => _getString(I18nKeys.navigateToFeatures, fallback: 'Navigate to Features');
  String get search => _getString(I18nKeys.search, fallback: 'Search');
  String get profile => _getString(I18nKeys.profile, fallback: 'Profile');
  
  // Quick Actions
  String get quickActions => _getString(I18nKeys.quickActions, fallback: 'Quick Actions');
  String get customize => _getString(I18nKeys.customize, fallback: 'Customize');
  String get transfer => _getString(I18nKeys.transfer, fallback: 'Transfer');
  String get request => _getString(I18nKeys.request, fallback: 'Request');
  String get stocks => _getString(I18nKeys.stocks, fallback: 'Stocks');
  String get products => _getString(I18nKeys.products, fallback: 'Products');
  
  // Rewards
  String get rewards => _getString(I18nKeys.rewards, fallback: 'Rewards');
  String get rewardPointsEarned => _getString(I18nKeys.rewardPointsEarned, fallback: 'Reward Points earned');
  String get claimRewardPoints => _getString(I18nKeys.claimRewardPoints, fallback: 'Claim upto 150 reward points after reaching the next transaction goal.');
  String get away => _getString(I18nKeys.away, fallback: 'away');
  
  // Offers
  String get offers => _getString(I18nKeys.offers, fallback: 'Offers');
  String get offersOnFlightBooking => _getString(I18nKeys.offersOnFlightBooking, fallback: 'Offers on Flight Booking');
  String get investInGold => _getString(I18nKeys.investInGold, fallback: 'Invest in Gold');
  String get toursAttractions => _getString(I18nKeys.toursAttractions, fallback: 'Tours & Attractions');
  String get investEarn => _getString(I18nKeys.investEarn, fallback: 'Invest & Earn');
  String get off => _getString(I18nKeys.off, fallback: 'Off');
  
  // Refer & Earn
  String get referEarn => _getString(I18nKeys.referEarn, fallback: 'Refer & Earn');
  String get inviteFriends => _getString(I18nKeys.inviteFriends, fallback: 'Invite friends and earn 50 points for each successful referral!');
  String get yourReferralCode => _getString(I18nKeys.yourReferralCode, fallback: 'Your Referral Code');
  String get shareLink => _getString(I18nKeys.shareLink, fallback: 'Share Link');
  
  // Profile Screen Strings
  String get personalInfo => _getString(I18nKeys.personalInfo, fallback: 'Personal Info');
  String get yourIDs => _getString(I18nKeys.yourIDs, fallback: 'Your IDs');
  String get notificationSettings => _getString(I18nKeys.notificationSettings, fallback: 'Notification Settings');
  String get inviteAndEarn => _getString(I18nKeys.inviteAndEarn, fallback: 'Invite and Earn');
  String get securitySettings => _getString(I18nKeys.securitySettings, fallback: 'Security Settings');
  String get employmentAndTaxDetails => _getString(I18nKeys.employmentAndTaxDetails, fallback: 'Employment and Tax Details');
  String get reachUs => _getString(I18nKeys.reachUs, fallback: 'Reach Us');
  String get termsAndConditions => _getString(I18nKeys.termsAndConditions, fallback: 'Terms and Conditions');
  String get logout => _getString(I18nKeys.logout, fallback: 'Logout');
  
  // Search Screen Strings
  String get searchDotDotDot => _getString(I18nKeys.searchDotDotDot, fallback: 'Search...');
  String get cancel => _getString(I18nKeys.cancel, fallback: 'Cancel');
  String get searchFor => _getString(I18nKeys.searchFor, fallback: 'Search for');
  String get whatsNew => _getString(I18nKeys.whatsNew, fallback: "What's new?");
  String get suggestions => _getString(I18nKeys.suggestions, fallback: 'Suggestions');
  String get searchResults => _getString(I18nKeys.searchResults, fallback: 'Search Results');
  String get searchForFinancialServices => _getString(I18nKeys.searchForFinancialServices, fallback: 'Search for financial services');
  String get searchForServices => _getString(I18nKeys.searchForServices, fallback: 'Search for services');
  String get tryFinanceLoanInvestment => _getString(I18nKeys.tryFinanceLoanInvestment, fallback: "Try: 'finance', 'loan', 'investment'");
  String get tryMobileBillsOffers => _getString(I18nKeys.tryMobileBillsOffers, fallback: "Try: 'mobile', 'bills', 'offers'");
  String get noResultsFound => _getString(I18nKeys.noResultsFound, fallback: 'No results found for');
  String get tryDifferentKeywords => _getString(I18nKeys.tryDifferentKeywords, fallback: 'Try different keywords');
  
  // Financial Services
  String get financialServices => _getString(I18nKeys.financialServices, fallback: 'Financial Services');
  String get instantFinance => _getString(I18nKeys.instantFinance, fallback: 'Instant Finance');
  String get homeFinance => _getString(I18nKeys.homeFinance, fallback: 'Home Finance');
  String get carFinance => _getString(I18nKeys.carFinance, fallback: 'Car Finance');
  String get personalFinance => _getString(I18nKeys.personalFinance, fallback: 'Personal Finance');
  String get businessLoans => _getString(I18nKeys.businessLoans, fallback: 'Business Loans');
  String get investmentPlans => _getString(I18nKeys.investmentPlans, fallback: 'Investment Plans');
  String get loanServices => _getString(I18nKeys.loanServices, fallback: 'Loan Services');
  String get mortgageServices => _getString(I18nKeys.mortgageServices, fallback: 'Mortgage Services');
  String get creditServices => _getString(I18nKeys.creditServices, fallback: 'Credit Services');
  String get bankingServices => _getString(I18nKeys.bankingServices, fallback: 'Banking Services');
  String get wealthManagement => _getString(I18nKeys.wealthManagement, fallback: 'Wealth Management');
  String get insuranceServices => _getString(I18nKeys.insuranceServices, fallback: 'Insurance Services');
  String get retirementPlanning => _getString(I18nKeys.retirementPlanning, fallback: 'Retirement Planning');
  
  // New User Services
  String get mobileRecharge => _getString(I18nKeys.mobileRecharge, fallback: 'Mobile Recharge');
  String get trackBillers => _getString(I18nKeys.trackBillers, fallback: 'Track Billers');
  String get creditCardBills => _getString(I18nKeys.creditCardBills, fallback: 'Credit card Bills');
  String get offersSearch => _getString(I18nKeys.offersSearch, fallback: 'Offers');
  String get yourChequeBook => _getString(I18nKeys.yourChequeBook, fallback: 'Your Cheque book');
  String get electricityBill => _getString(I18nKeys.electricityBill, fallback: 'Electricity Bill');
  String get waterBill => _getString(I18nKeys.waterBill, fallback: 'Water Bill');
  String get gasBill => _getString(I18nKeys.gasBill, fallback: 'Gas Bill');
  String get dthRecharge => _getString(I18nKeys.dthRecharge, fallback: 'DTH Recharge');
  String get broadbandBill => _getString(I18nKeys.broadbandBill, fallback: 'Broadband Bill');
  String get insurancePremium => _getString(I18nKeys.insurancePremium, fallback: 'Insurance Premium');
  String get loanPayment => _getString(I18nKeys.loanPayment, fallback: 'Loan Payment');
  String get postpaidBill => _getString(I18nKeys.postpaidBill, fallback: 'Postpaid Bill');
  String get landlineBill => _getString(I18nKeys.landlineBill, fallback: 'Landline Bill');
  String get municipalTax => _getString(I18nKeys.municipalTax, fallback: 'Municipal Tax');
  String get educationFee => _getString(I18nKeys.educationFee, fallback: 'Education Fee');
  String get fastagRecharge => _getString(I18nKeys.fastagRecharge, fallback: 'Fastag Recharge');
  String get cableTvBill => _getString(I18nKeys.cableTvBill, fallback: 'Cable TV Bill');
  
  // Feature Titles
  String get trackSpends => _getString(I18nKeys.trackSpends, fallback: 'Track Spends');
  String get trackForex => _getString(I18nKeys.trackForex, fallback: 'Track Forex');
  
  // Search Repository Strings
  String get discoveryFeature => _getString(I18nKeys.discoveryFeature, fallback: 'Discovery Feature');
  
  // User Repository Strings
  String get userName => _getString(I18nKeys.userName, fallback: 'Alqabiadi');
  String get userEmail => _getString(I18nKeys.userEmail, fallback: 'aliahmed@example.com');
  String get userLocation => _getString(I18nKeys.userLocation, fallback: 'alabama');
  String get userId => _getString(I18nKeys.userId, fallback: '00052321');
}