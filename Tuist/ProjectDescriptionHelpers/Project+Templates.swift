import ProjectDescription
import Foundation

#if canImport(PrivateKey)
import PrivateKey
#endif

public extension Project {
    static var appSigningSettings: [String: SettingValue] {
        var settings: [String: SettingValue] = [
            "DEVELOPMENT_TEAM": .string(PrivateKey.teamID),
            "CODE_SIGN_STYLE": .string("Automatic"),
            "CODE_SIGN_IDENTITY": .string("Apple Development"),
            "SWIFT_VERSION": .string(AppConfiguration.Project.swiftVersion)
        ]
        return settings
    }
    
    static var frameworkSigningSettings: [String: SettingValue] {
        var settings: [String: SettingValue] = [
            "CODE_SIGN_STYLE": .string("Manual"),
            "CODE_SIGN_IDENTITY": .string(""),
            "CODE_SIGNING_ALLOWED": .string("NO"),
            "SWIFT_VERSION": .string(AppConfiguration.Project.swiftVersion)
        ]
        return settings
    }
    
    static func module(
        name: String,
        moduleType: ModuleType,
        layer: Layer,
        bundleId: String,
        targets: [Target],
        packages: [Package] = [],
        additionalFiles: [FileElement] = []
    ) -> Project {
        let projectPath = "\(layer.path)/\(name)"
        
        return Project(
            name: name,
            organizationName: AppConfiguration.Project.organizationName,
            packages: packages,
            targets: targets,
            additionalFiles: additionalFiles
        )
    }
    
    static func app(
        name: String,
        bundleId: String,
        dependencies: [TargetDependency] = []
    ) -> Project {
        let mainTarget = Target.target(
            name: name,
            destinations: .iOS,
            product: .app,
            bundleId: bundleId,
            deploymentTargets: AppConfiguration.Project.deploymentTargets,
            infoPlist: .app(name: name),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies,
            settings: .settings(base: Project.appSigningSettings)
        )
        
        let testTarget = Target.target(
            name: "\(name)Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: AppConfiguration.BundleID.tests(bundleId),
            deploymentTargets: AppConfiguration.Project.deploymentTargets,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)],
            settings: .settings(base: Project.frameworkSigningSettings)
        )
        
        let uiTestTarget = Target.target(
            name: "\(name)UITests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: AppConfiguration.BundleID.uiTests(bundleId),
            deploymentTargets: AppConfiguration.Project.deploymentTargets,
            infoPlist: .default,
            sources: ["UITests/**"],
            dependencies: [.target(name: name)],
            settings: .settings(base: Project.frameworkSigningSettings)
        )
        
        return Project(
            name: name,
            organizationName: AppConfiguration.Project.organizationName,
            targets: [mainTarget, testTarget, uiTestTarget]
        )
    }
    
    static func framework(
        name: String,
        bundleId: String,
        dependencies: [TargetDependency] = [],
        hasTests: Bool = true,
        hasDemo: Bool = false
    ) -> Project {
        var targets: [Target] = []
        
        // Main framework target
        let mainTarget = Target.target(
            name: name,
            destinations: .iOS,
            product: .framework,
            bundleId: bundleId,
            deploymentTargets: AppConfiguration.Project.deploymentTargets,
            infoPlist: .framework(name: name),
            sources: ["Sources/**"],
            resources: name == "DesignSystem" ? ["Resources/**"] : [],
            dependencies: dependencies,
            settings: .settings(base: Project.frameworkSigningSettings)
        )
        targets.append(mainTarget)
        
        // Tests target
        if hasTests {
            let testTarget = Target.target(
                name: "\(name)Tests",
                destinations: .iOS,
                product: .unitTests,
                bundleId: AppConfiguration.BundleID.tests(bundleId),
                deploymentTargets: AppConfiguration.Project.deploymentTargets,
                infoPlist: .default,
                sources: ["Tests/**"],
                dependencies: [.target(name: name)],
                settings: .settings(base: Project.frameworkSigningSettings)
            )
            targets.append(testTarget)
        }
        
        // Demo app target
        if hasDemo {
            let demoTarget = Target.target(
                name: "\(name)Demo",
                destinations: .iOS,
                product: .app,
                bundleId: AppConfiguration.BundleID.demo(bundleId),
                deploymentTargets: AppConfiguration.Project.deploymentTargets,
                infoPlist: .demo(name: "\(name)Demo"),
                sources: ["Demo/Sources/**"],
                dependencies: [.target(name: name)],
                settings: .settings(base: Project.appSigningSettings)
            )
            targets.append(demoTarget)
        }
        
        return Project(
            name: name,
            organizationName: AppConfiguration.Project.organizationName,
            targets: targets
        )
    }
    
    // MARK: - Convenience Methods using ModuleConfiguration
    static func app(configuration: ModuleConfiguration, dependencies: [TargetDependency] = []) -> Project {
        return app(
            name: configuration.name,
            bundleId: configuration.bundleId,
            dependencies: dependencies
        )
    }
    
    static func framework(configuration: ModuleConfiguration, dependencies: [TargetDependency] = []) -> Project {
        return framework(
            name: configuration.name,
            bundleId: configuration.bundleId,
            dependencies: dependencies,
            hasTests: configuration.hasTests,
            hasDemo: configuration.hasDemo
        )
    }
} 