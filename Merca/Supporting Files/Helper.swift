//
//  Helper.swift
//  Merca
//
//  Created by Khaled Bohout on 11/02/2021.
//


import Foundation
import UIKit
import SystemConfiguration

//func startLoading(viewController: UIViewController) {
//
//    let image = GIFImageView()
//    image.animate(withGIFNamed: "GPless--logo-gif")
//    viewController.view.addSubview(image)
//    image.center = CGPoint(x: viewController.view.frame.size.width/2, y:
//                            viewController.view.frame.size.height/2)
//    image.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    image.contentMode = .scaleAspectFit
//}


func getCurrentDate() -> String {
    let today = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.locale = Locale(identifier: "en_US")
    return (formatter.string(from: today))
}

func getLastWeakDate() -> String {
    
    let lastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date())!
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.dateFormat = "yyyy-MM-dd"
    return (formatter.string(from: lastWeekDate))
}



func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

 func getUserData() -> Bool{
    let def = UserDefaults.standard
    return (def.object(forKey: "accessToken") as? String) != nil
}

func getaccessToken() -> String{
   let def = UserDefaults.standard
    return def.object(forKey: "accessToken") as! String
}

func getUserId() -> Int {
    
    let def = UserDefaults.standard
    return def.object(forKey: "id") as! Int
}

func getDeviceToken() -> String {
    
    let def = UserDefaults.standard
    return def.object(forKey: "deviceToken") as? String ?? ""
}

func setDeviceToken(deviceToken: String) {
    
    let def = UserDefaults.standard
    def.setValue(deviceToken, forKey: "deviceToken")
}

func getUserType() -> String {
    
    let def = UserDefaults.standard
    return def.object(forKey: "userType") as? String ?? "0"
}

func setUserType(userType: String)  {
    
    let def = UserDefaults.standard
    def.setValue(userType, forKey: "userType")
}

func getUserMobile() -> String {
    
    let def = UserDefaults.standard
    return def.object(forKey: "phone") as? String ?? "0"
}

//func setUserData(user: User) {
//
//    let def = UserDefaults.standard
//
//
//    def.setValue(user.id, forKey: "id")
//    def.setValue(user.phone, forKey: "phone")
//    def.setValue(user.fullName, forKey: "fullName")
//    def.setValue(user.accountType, forKey: "accountType")
//    def.setValue(user.email, forKey: "email")
//    def.setValue(user.tokens?.accessToken, forKey: "accessToken")
//    def.setValue(user.address, forKey: "address")
//    def.setValue(user.createdAt, forKey: "createdAt")
//    def.setValue(user.loginMethod, forKey: "loginMethod")
//    def.setValue(user.promoCode, forKey: "promoCode")
//    def.setValue(user.tokens?.refreshToken, forKey: "refreshToken")
//
//    def.synchronize()
//
//}
//
//func logingUser(user: LoginResponse) {
//
//    print(user)
//
//    let def = UserDefaults.standard
//
//    def.setValue(user.token, forKey: "accessToken")
//
//    def.setValue(user.id, forKey: "id")
//
//    def.synchronize()
//
//}

func logout(){
    
    let def = UserDefaults.standard
    
    def.removeObject(forKey: "id")
    def.removeObject(forKey: "phone")
    def.removeObject(forKey: "fullName")
    def.removeObject(forKey: "accountType")
    def.removeObject(forKey: "email")
    def.removeObject(forKey: "accessToken")
    def.removeObject(forKey: "address")
    def.removeObject(forKey: "createdAt")
    def.removeObject(forKey: "loginMethod")
    def.removeObject(forKey: "promoCode")
    def.removeObject(forKey: "refreshToken")
}

// func restartApp(){
//
//    guard let window = UIApplication.shared.keyWindow else{return}
//
//    let storyboard = UIStoryboard(name: "Home", bundle: nil)
//    var vc:UIViewController
//    vc = storyboard.instantiateViewController(withIdentifier: "HomeTBC") as! SSCustomTabBarViewController
//    vc.tabBarController?.tabBar.semanticContentAttribute = .forceLeftToRight
//    window.rootViewController = vc
//    UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
//
//}

 func dialNumber(number : String) {
    
    if let url = URL(string: "tel://\(number)"),
        UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url, options: [:], completionHandler:nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    } else {
        // add error message here
    }
}


//func addLoadingView(mySubview: UIView, loaderGif: GIFImageView, view: UIView) {
//    
//    mySubview.backgroundColor = UIColor.white
//    
//    // 1.
//    view.addSubview(mySubview)
//    mySubview.addSubview(loaderGif)
//    loaderGif.animate(withGIFNamed: "GPless--logo-gif")
//
//    // 2. For example:
//    loaderGif.translatesAutoresizingMaskIntoConstraints = false
//    
//    if UIDevice.current.userInterfaceIdiom == .pad {
//        
//        NSLayoutConstraint.activate([
//            loaderGif.widthAnchor.constraint(equalToConstant: 110),
//            loaderGif.heightAnchor.constraint(equalToConstant: 135),
//            loaderGif.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            loaderGif.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
//        ])
//
//        
//    } else {
//        
//        NSLayoutConstraint.activate([
//            loaderGif.widthAnchor.constraint(equalToConstant: 90),
//            loaderGif.heightAnchor.constraint(equalToConstant: 100),
//            loaderGif.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            loaderGif.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
//        ])
//
//    }
//    
//
//    
//    
//    mySubview.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//        mySubview.widthAnchor.constraint(equalToConstant: view.frame.width),
//        mySubview.heightAnchor.constraint(equalToConstant: view.frame.height),
//        mySubview.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//        mySubview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
//    ])
//}

public class Reachable  {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
        
    }
    
    func computeURL(url: String) {

        let components = transformURLString(url)

        if let url = components?.url {
            print("valid")
        } else {
            print("invalid")
        }
    }

    func transformURLString(_ string: String) -> URLComponents? {
        guard let urlPath = string.components(separatedBy: "?").first else {
            return nil
        }
        var components = URLComponents(string: urlPath)
        if let queryString = string.components(separatedBy: "?").last {
            components?.queryItems = []
            let queryItems = queryString.components(separatedBy: "&")
            for queryItem in queryItems {
                guard let itemName = queryItem.components(separatedBy: "=").first,
                      let itemValue = queryItem.components(separatedBy: "=").last else {
                        continue
                }
                components?.queryItems?.append(URLQueryItem(name: itemName, value: itemValue))
            }
        }
        return components!
    }
    

    

    
}
