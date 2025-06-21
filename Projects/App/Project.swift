import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    configuration: .app(name: "BuyingMyHome"),
    dependencies: [
        .thirdParty,
        .domain,
        .core,
        .designSystem,
        .navigation,
        .homeFeature,
        .searchFeature,
        .favoriteFeature,
        .profileFeature
    ]
) 