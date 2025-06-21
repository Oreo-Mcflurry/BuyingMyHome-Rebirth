import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    configuration: .core(name: "Navigation"),
    dependencies: [
        .thirdParty,
        .domain
    ]
) 