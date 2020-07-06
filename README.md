# Photos Gallery

Small application that uses REST service from [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com).

The application displays a list of users, their albums and photos.

## Dependencies

Using [CocoaPods](https://cocoapods.org), in the root of the project run `pod install` and then compile the project using `PhotoGallery.xcworkspace`. 

## SwiftLint
This project uses [SwiftLint](https://github.com/realm/SwiftLint) to ensure a consistent code style and also help to avoid common errors.

## Architecture
This project uses MVVM-C architecture.

## Notes
*  `PhotosViewController` was intended to have a `UICollectionView` instead of `UITableView` and display a gallery with the photos. The idea was to use [SDWebImage](https://github.com/SDWebImage/SDWebImage) for displaying the pictures.
* `PhotoCell` was intended to be a `UICollectionViewCell` and content a image view for the photo.
* `UserCell` and `AlbumCell` are different classes although they look similar, with the intention to style the UI differently for albums or users.
* `UsersViewController` `AlbumsViewController` and pretty similar, the idea, again, was to have different view controller for styling the ui in a different way for each one.
* A view model for each `Album`, `Photo` and `User` should be passed through the views instead of the raw models. 
* View models protocols and coordinator protocols were created with the intention to make the app testable and each module to not depend on concrete implementations.
* I would have liked to add a way to cancel the task from the apiClient.
* The models were created with help of [Quicktype](https://quicktype.io)
* Error handlind and loading states are TODOs.
