import ProjectDescription

public extension InfoPlist {
    static func app(name: String) -> InfoPlist {
        return .extendingDefault(with: [
            "CFBundleDisplayName": "\(name)",
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen",
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait"
            ],
            "UISupportedInterfaceOrientations~ipad": [
                "UIInterfaceOrientationPortrait",
                "UIInterfaceOrientationLandscapeLeft",
                "UIInterfaceOrientationLandscapeRight"
            ],
            "UIUserInterfaceStyle": "Light"
        ])
    }
    
    static func framework(name: String) -> InfoPlist {
        return .extendingDefault(with: [
            "CFBundleDisplayName": "\(name)",
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1"
        ])
    }
    
    static func demo(name: String) -> InfoPlist {
        return .extendingDefault(with: [
            "CFBundleDisplayName": "\(name)",
            "CFBundleShortVersionString": "1.0.0",
            "CFBundleVersion": "1",
            "UILaunchStoryboardName": "LaunchScreen",
            "UISupportedInterfaceOrientations": [
                "UIInterfaceOrientationPortrait"
            ]
        ])
    }
} 