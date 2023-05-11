# Flutter navigation with riverpod, go_router and clean architecture

In my projects I like to use the clean code approach with Riverpod, GoRouter and Appwrite *fancyshit. 
This provides for implementing a feature for each expertise. With a view to routing and user authentication, 
this can quickly become "hell". 
To keep the overview, I use a separate auth feature and an encapsulated routing in a core feature which provides 
the possibility to centrally register routing configurations of the individual features.
This is a clean code sample implementation using Appwrite, Riverpod and GoRouter for user authentication and app 
navigation. To avoid having to manually create the folder structure for each feature, the mason brick 
nk_riverpod_feature is used. The brick creates the basic feature structure.

## Getting Started

First of all, you need an Appwrite instance and an Appwrite project with defined users. 
To use the sample implementation, you need to configure your Appwrite project in the `appwrite_project.dart` file.

## Nice to know

- [Appwrite](https://appwrite.io)
- [Mason](https://https://brickhub.dev/)
- [Mason Brick nk_riverpod_feature](https://brickhub.dev/bricks/nk_riverpod_feature)