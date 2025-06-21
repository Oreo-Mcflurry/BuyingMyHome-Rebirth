import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Feature template",
    attributes: [
        nameAttribute
    ],
    items: [
        // Project.swift
        .file(
            path: "Projects/Features/\(nameAttribute)Feature/Project.swift",
            templatePath: "project.stencil"
        ),
        // Sources
        .file(
            path: "Projects/Features/\(nameAttribute)Feature/Sources/\(nameAttribute)ViewController.swift",
            templatePath: "viewcontroller.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)Feature/Sources/\(nameAttribute)ViewModel.swift",
            templatePath: "viewmodel.stencil"
        ),
        // Tests
        .file(
            path: "Projects/Features/\(nameAttribute)Feature/Tests/\(nameAttribute)ViewControllerTests.swift",
            templatePath: "tests.stencil"
        ),
        // Demo
        .file(
            path: "Projects/Features/\(nameAttribute)Feature/Demo/Sources/AppDelegate.swift",
            templatePath: "demo_appdelegate.stencil"
        ),
        .file(
            path: "Projects/Features/\(nameAttribute)Feature/Demo/Sources/SceneDelegate.swift",
            templatePath: "demo_scenedelegate.stencil"
        ),
        // Resources directory
        .directory(
            path: "Projects/Features/\(nameAttribute)Feature/Demo/Resources"
        )
    ]
) 