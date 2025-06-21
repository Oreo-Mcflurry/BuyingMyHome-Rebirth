import ProjectDescription

public extension TargetDependency {
    // MARK: - ThirdParty Layer
    static let thirdParty = TargetDependency.project(target: "ThirdParty", path: .relativeToRoot("Projects/ThirdParty"))
    
    // MARK: - Domain Layer
    static let domain = TargetDependency.project(target: "Domain", path: .relativeToRoot("Projects/Domain"))
    
    // MARK: - Core Layer
    static let core = TargetDependency.project(target: "Core", path: .relativeToRoot("Projects/Core"))
    static let networking = TargetDependency.project(target: "Networking", path: .relativeToRoot("Projects/Core"))
    static let localStorage = TargetDependency.project(target: "LocalStorage", path: .relativeToRoot("Projects/Core"))
    
    // MARK: - DesignSystem
    static let designSystem = TargetDependency.project(target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem"))
    
    // MARK: - Navigation
    static let navigation = TargetDependency.project(target: "Navigation", path: .relativeToRoot("Projects/Navigation"))
    
    // MARK: - Features
    static let homeFeature = TargetDependency.project(target: "HomeFeature", path: .relativeToRoot("Projects/Features/HomeFeature"))
    static let searchFeature = TargetDependency.project(target: "SearchFeature", path: .relativeToRoot("Projects/Features/SearchFeature"))
    static let favoriteFeature = TargetDependency.project(target: "FavoriteFeature", path: .relativeToRoot("Projects/Features/FavoriteFeature"))
    static let profileFeature = TargetDependency.project(target: "ProfileFeature", path: .relativeToRoot("Projects/Features/ProfileFeature"))
    
    // MARK: - External Dependencies (Deprecated - Use ThirdParty module instead)
    static let rxSwift = TargetDependency.external(name: "RxSwift")
    static let rxCocoa = TargetDependency.external(name: "RxCocoa")
    static let rxRelay = TargetDependency.external(name: "RxRelay")
    static let rxFlow = TargetDependency.external(name: "RxFlow")
}

public struct ModulePaths {
    public static let app = Path.relativeToRoot("Projects/App")
    public static let thirdParty = Path.relativeToRoot("Projects/ThirdParty")
    public static let domain = Path.relativeToRoot("Projects/Domain")
    public static let core = Path.relativeToRoot("Projects/Core")
    public static let designSystem = Path.relativeToRoot("Projects/DesignSystem")
    public static let navigation = Path.relativeToRoot("Projects/Navigation")
    public static let features = Path.relativeToRoot("Projects/Features")
} 