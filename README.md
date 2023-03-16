
    <h1>Output</h1>
    <br>
    <table>
        <img src="https://github.com/TariqMehmood1004/FlutterApp/blob/main/Output/1.jpg" alt="Output results">
        <img src="https://github.com/TariqMehmood1004/FlutterApp/blob/main/Output/2.jpg" alt="Output results">
        <img src="https://github.com/TariqMehmood1004/FlutterApp/blob/main/Output/3.jpg" alt="Output results">
        <img src="https://github.com/TariqMehmood1004/FlutterApp/blob/main/Output/4.jpg" alt="Output results">
    </table>
    <hr>
    <h1>Documentation</h1>
    <br>

    <h3>1. SplashScreen Widget</h3>
    <pre>
        /*
        # Timer() method get duration, and navigator.
        Duration - After how many seconds the navigated page route opens.
        MaterialPageRoute() method get contex to returns screen route.
        */
        @override
        void initState() {
        super.initState();
        
        Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
        context,
        //MaterialPageRoute() method get contex to returns screen route.
        MaterialPageRoute(
        builder: (context) =>
        const DashboardScreen(title: "Dashboard Screen"),
        ),
        );
        });
    </pre>