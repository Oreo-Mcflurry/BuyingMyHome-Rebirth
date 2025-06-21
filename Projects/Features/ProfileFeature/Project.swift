import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .feature(name: "ProfileFeature"),
    dependencies: [
        .thirdParty,
        .domain,
        .core,
        .designSystem,
        .navigation
    ]
) 