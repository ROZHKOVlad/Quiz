import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .badge]
        ) { (success, error) in
            if success {
                // `UNUserNotificationCenter` returns from a background thread
                DispatchQueue.main.async {
                    // Register to get `deviceToken`
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else if let error = error {
                print(error)
            }
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

