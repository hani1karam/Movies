//
//  AppDelegate.swift
//  Movies
//
//  Created by hany karam on 3/31/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let splitViewController = UISplitViewController()
        let rootViewController = UINavigationController(rootViewController: MoviesSceneConfigurator.configure())
        let infoViewController = UINavigationController(rootViewController: MovieInfoSceneConfigurator.configure())
        splitViewController.viewControllers = [rootViewController, infoViewController]
        splitViewController.delegate = self
        
        if let moviesViewController = rootViewController.topViewController as? MoviesVC,
           let infoViewController = infoViewController.topViewController as? MovieInfoVC {
            moviesViewController.delegate = infoViewController
        }
        
        splitViewController.preferredDisplayMode = .allVisible
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController:UIViewController,
                             onto primaryViewController:UIViewController) -> Bool {
        
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? MovieInfoVC else { return false }
        if ((topAsDetailController.dataStore?.movie) != nil) {
            return true
        }
        return false
    }
    
}

