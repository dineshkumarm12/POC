//
//  SceneDelegate.swift
//  LOR
//
//  Created by Dineshkumar on 24/04/25.
//

import UIKit
import SwiftUI
import MobileSync
import SalesforceSDKCore

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // MARK: - UISceneDelegate Implementation
    
    func scene(_ scene: UIScene,
               openURLContexts urlContexts: Set<UIOpenURLContext>)
    {
  
        // Uncomment when enabling log in via Salesforce UI Bridge API generated QR codes.
        /*
         * Note: The app's Info.plist must be updated with the URL type, scheme
         * and any other desired options to support custom URL scheme deep links
         * for the QR login code.  It is possible to use universal links for
         * this also so long as the app is configured, the UI bridge API
         * parameters are obtained and passed to
         * LoginTypeSelectionViewController.loginWithFrontdoorBridgeUrl
         */
//         When the app process was running and receives a custom URL scheme deep link, use login QR code if applicable.
//        if let urlContext = urlContexts.first {
//            useQrCodeLogInUrl(urlContext.url)
//        }
    }
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions)
    {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
       
        AuthHelper.registerBlock(forCurrentUserChangeNotifications: {
           self.resetViewState {
               self.setupRootViewController()
           }
        })
        
        // Uncomment when enabling log in via Salesforce UI Bridge API generated QR codes.
        // When the app process was not running and receives a custom URL scheme deep link, use login QR code if applicable.
//        if let urlContext = connectionOptions.urlContexts.first {
//            useQrCodeLogInUrl(urlContext.url)
//        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        self.initializeAppViewState()
        AuthHelper.loginIfRequired {
            self.setupRootViewController()
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    // MARK: - Private Methods
    
   func initializeAppViewState() {
       if (!Thread.isMainThread) {
           DispatchQueue.main.async {
               self.initializeAppViewState()
           }
           return
       }
       
       self.window?.rootViewController = InitialViewController(nibName: nil, bundle: nil)
       self.window?.makeKeyAndVisible()
   }
   
   func setupRootViewController() {
       // Setup store based on config userstore.json
       MobileSyncSDKManager.shared.setupUserStoreFromDefaultConfig()
       // Setup syncs based on config usersyncs.json
       MobileSyncSDKManager.shared.setupUserSyncsFromDefaultConfig()
    
       self.window?.rootViewController = UIHostingController(
           rootView: LandingView() //PermissionListView() //UserView() //AccountsListView()
       )
   }
   
   func resetViewState(_ postResetBlock: @escaping () -> ()) {
       if let rootViewController = self.window?.rootViewController {
           if let _ = rootViewController.presentedViewController {
               rootViewController.dismiss(animated: false, completion: postResetBlock)
               return
           }
       }
       postResetBlock()
   }

}
