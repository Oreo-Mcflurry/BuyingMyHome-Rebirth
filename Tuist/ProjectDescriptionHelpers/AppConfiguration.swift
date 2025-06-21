import ProjectDescription

// MARK: - App Configuration
public struct AppConfiguration {
    // MARK: - iOS Configuration
    public struct iOS {
        /// 전체 프로젝트의 최소 지원 iOS 버전 (여기만 바꾸면 전체에 반영)
        public static let targetVersion = "15.0"
        public static let deploymentTargets: DeploymentTargets = .iOS(targetVersion)
    }
    
    // MARK: - Swift Configuration
    public struct Swift {
        public static let version = "6.0"
    }
    
    // MARK: - Organization Configuration
    public struct Organization {
        public static let name = "yoo"
    }
    
    // MARK: - Bundle ID Configuration
    public struct BundleID {
        public static let base = "com.yoo.BuyingMyhome"
        
        public static func app(_ name: String) -> String {
            return base
        }
        
        public static func framework(_ name: String) -> String {
            return "\(base).\(name.lowercased())"
        }
        
        public static func tests(_ bundleId: String) -> String {
            return "\(bundleId).tests"
        }
        
        public static func uiTests(_ bundleId: String) -> String {
            return "\(bundleId).uitests"
        }
        
        public static func demo(_ bundleId: String) -> String {
            return "\(bundleId).demo"
        }
    }
    
    // MARK: - Project Configuration
    public struct Project {
        public static let organizationName = Organization.name
        public static let swiftVersion = Swift.version
        public static let iOSTargetVersion = iOS.targetVersion
        public static let deploymentTargets = iOS.deploymentTargets
    }
}

// MARK: - Module Configuration
public enum ModuleConfiguration {
    case app(name: String)
    case framework(name: String, hasTests: Bool = true, hasDemo: Bool = false)
    case feature(name: String)
    case core(name: String)
    case designSystem(name: String)
    case shared(name: String)
    
    public var name: String {
        switch self {
        case .app(let name):
            return name
        case .framework(let name, _, _):
            return name
        case .feature(let name):
            return name
        case .core(let name):
            return name
        case .designSystem(let name):
            return name
        case .shared(let name):
            return name
        }
    }
    
    public var bundleId: String {
        switch self {
        case .app(let name):
            return AppConfiguration.BundleID.app(name)
        case .framework(let name, _, _):
            return AppConfiguration.BundleID.framework(name)
        case .feature(let name):
            return AppConfiguration.BundleID.framework(name)
        case .core(let name):
            return AppConfiguration.BundleID.framework(name)
        case .designSystem(let name):
            return AppConfiguration.BundleID.framework(name)
        case .shared(let name):
            return AppConfiguration.BundleID.framework(name)
        }
    }
    
    public var hasTests: Bool {
        switch self {
        case .app:
            return true
        case .framework(_, let hasTests, _):
            return hasTests
        case .feature:
            return true
        case .core:
            return true
        case .designSystem:
            return false
        case .shared:
            return false
        }
    }
    
    public var hasDemo: Bool {
        switch self {
        case .app:
            return false
        case .framework(_, _, let hasDemo):
            return hasDemo
        case .feature:
            return true
        case .core:
            return false
        case .designSystem:
            return true
        case .shared:
            return false
        }
    }
    
    public var product: Product {
        switch self {
        case .app:
            return .app
        case .framework, .feature, .core, .designSystem, .shared:
            return .framework
        }
    }
} 