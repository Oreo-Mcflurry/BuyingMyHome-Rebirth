import ProjectDescription

public enum ModuleType: String, CaseIterable {
    case app = "App"
    case framework = "Framework"
    case feature = "Feature"
    case core = "Core"
    case designSystem = "DesignSystem"
    case shared = "Shared"
    
    public var hasTests: Bool {
        switch self {
        case .app, .framework, .feature, .core:
            return true
        case .designSystem, .shared:
            return false
        }
    }
    
    public var hasDemo: Bool {
        switch self {
        case .designSystem, .feature:
            return true
        default:
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
    
    public var configuration: ModuleConfiguration {
        switch self {
        case .app:
            return .app(name: "BuyingMyHome")
        case .framework:
            return .framework(name: "Framework")
        case .feature:
            return .feature(name: "Feature")
        case .core:
            return .core(name: "Core")
        case .designSystem:
            return .designSystem(name: "DesignSystem")
        case .shared:
            return .shared(name: "Shared")
        }
    }
}

public enum Layer: String, CaseIterable {
    case app = "App"
    case feature = "Feature"
    case core = "Core"
    case shared = "Shared"
    
    public var path: String {
        switch self {
        case .app:
            return "Projects/App"
        case .feature:
            return "Projects/Features"
        case .core:
            return "Projects/Core"
        case .shared:
            return "Projects/Shared"
        }
    }
} 