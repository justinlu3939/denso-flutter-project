class DataModel{
  final String title;
  final String imageName;
  final String description;
  final String websiteCode;
  DataModel(
    this.title,
    this.imageName,
    this.description,
    this.websiteCode,
  );
}

List<DataModel> dataList = [
  DataModel('DENSO and Certhon Introduce Artemy®, A Fully Automated Cherry Truss Tomato Harvesting Robot',
   'Images/example1.jpg',
    'KARIYA, Japan (May.13,2024) — DENSO CORPORATION and its group company, Certhon Build B.V., will begin accepting commercial orders for the fully automated cherry truss tomato harvesting robot, "Artemy," in Europe starting this May 14th . Artemy is an innovative robot that can perform a series of cherry truss tomato harvesting tasks in a fully automatic manner. The basic functions are as follows.\nAutomatic Harvesting Function: It automatically runs on a running lane (a hot water tube installed in a greenhouse) and uses AI to determine the ripeness of cherry truss tomatoes. Only ripe tomatoes are selected, and cherry truss tomato peduncles are cut using scissors attached to the top of the harvesting robot arm and stored in the loaded crates.\nAutomatic Lane Change Function: Artemy uses sensing technology to recognize obstacles in the path and the running lane to which it is traveling so it can move safely and accurately to adjacent running lanes even in trackless environment. (Photo 2)\nAutomatic Crates Replacement: Artemy automatically replaces a full crate.\nAutomatic Crates Transfer: When all six crates are loaded, Artemy automatically moves to the trolley where the empty crates are placed and replaces all the crates at once. (Photo 3)',
    'Cherry'),
  DataModel('NTT DATA and DENSO Sign a Basic Agreement on Strategic Partnership for Software', 
    'Images/example2.jpg', 
    'On June 12, 2024, NTT DATA Japan Corporation (“NTT DATA”) and DENSO CORPORATION (“DENSO”) have signed a memorandum of understanding to form a strategic partnership for software development. Through the agreement, the companies will deepen their collaboration on strategy, talent management, and technology as they jointly contribute to the advancement of Japan’s automotive industry and help address social issues. The partnership between DENSO, which has strengths in vehicle (in-car) technologies including in-vehicle software, and NTT DATA, which has strengths in outside-car technologies including cloud computing, aims to quickly and efficiently develop and offer in-vehicle software,', 
    'NTT'),
  DataModel('DENSO Announces MobiQ for the Automotive Aftermarket', 
  'Images/example3.jpg', 
  '"MobiQ stands for mobility, intelligence and quality," said Hiroshi Yanone, senior manager of Connected Services at DENSO Products and Services Americas. "We are committed to the smart mobility market and are excited to bring 75 years of automotive expertise to promote safer, more efficient and cleaner movement of people, vehicles and cargo on the road today."', 
  'MobiQ'),
  DataModel('DENSO Products and Services Americas Celebrates 50 Years in America', 
  'Images/example4.jpg', 
  'DENSO Products and Services Americas (DPAM), Inc., an affiliate of leading global automotive supplier DENSO Corp., today kicks off a year of commemorative activities to celebrate the company’s 50th anniversary in America. One of the largest private employers in Long Beach, the aftermarket automotive parts and mobility solutions powerhouse has been honored with a formal proclamation signed by Long Beach Mayor Robert Garcia in recognition of its half-century milestone.', 
  '50'),
];