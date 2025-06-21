import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .feature(name: "FavoriteFeature"),
    dependencies: [
        .thirdParty,
        .domain,
        .core,
        .designSystem,
        .navigation
    ]
) 