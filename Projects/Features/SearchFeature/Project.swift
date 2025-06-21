import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .feature(name: "SearchFeature"),
    dependencies: [
        .thirdParty,
        .domain,
        .core,
        .designSystem,
        .navigation
    ]
) 