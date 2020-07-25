import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        let viewController = AppNavigationCordinator.buildMovieListModule()
        let navigationController = UINavigationController(rootViewController: viewController)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let mainWindow = UIWindow(windowScene: windowScene)
            mainWindow.rootViewController = navigationController
            self.window = mainWindow
            mainWindow.makeKeyAndVisible()
            UINavigationBar.applyTheme()
        }
    }
}

