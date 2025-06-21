import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .feature(name: "HomeFeature"),
    dependencies: [
        .thirdParty,
        .domain,
        .core,
        .designSystem,
        .navigation
    ]
) 