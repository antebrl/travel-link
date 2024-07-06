The overall architecture of our features heavily depends on the firebase architecture below. It is a good overview how the system is structured.

For the app structure, we used a feature based approach!

## Firebase Architecture
We used  

- **Firestore** for all data
- **Firebase Storage** for storage of images (profile picture, trip gallery and activity pictures)
- **Firebase Auth** for user authentication.

``` mermaid
classDiagram
    note for Activity "Directly used in Explore Activities pages"
    note for Trip "Used in Trip pages"
namespace Firestore {
    class UserProfile {
        +String uid
        +String displayName
        +String pictureUrl
        +Float[] position
        +String description
    }

    
    class Activity {
        +String activityId
        +String[] categories
        +String creatorId
        +String description
        +String[] imagePaths
        +Boolean isPublic
        +Boolean isUserCreated
        +Location location
        +String name
        +String openingHours
        +String placeId
        +String website
        +String wikidataUrl
    }

    class Location {
        +String locationId
        +String city
        +String country
        +String countryCode
        +String formatted
        +Float lat
        +Float lon
    }
    
    class Trip {
        +String tripId
        +String description
        +Destination destination
        +String[] images
        +Boolean isPublic
        +Int maxParticipants
        +String name
        +String[] participants
        +DateTime startDate
        +DateTime endDate
    }

    class Destination {
        +String destinationId
        +String country
        +String formatted
        +Float lat
        +Float lon
        +String place_id
    }

    class ChecklistItem {
        +String checklistItemId
        +String[] assignees
        +Boolean[] assigneesCompleted
        +DateTime createdAt
        +DateTime dueDate
        +Boolean isPublic
        +Boolean onlyOneCompletion
        +String title
    }

    class GalleryItem {
        +String id
        +String description
        +String pictureUrl
        +DateTime timestamp
        +String creatorId
    }

    class ChatMessage {
        +String id
        +String message
        +DateTime timestamp
        +String creatorId
    }
}

    UserProfile -- FirebaseAuth : authentication
    Trip "1" .. Destination : has
    Trip "1" o--> "0..*" Activity : sub-collection
    Trip "1" o--> "0..*" ChecklistItem : sub-collection
    Trip "1" o--> "0..*" GalleryItem : sub-collection
    Trip "1" o--> "0..*" ChatMessage : sub-collection
    Activity .. Location : has

    Activity "0..*" ..> "1" UserProfile
    ChecklistItem "0..*" ..> "1..*" UserProfile
    GalleryItem "0..*" ..> "1" UserProfile
    ChatMessage "0..*" ..> "1" UserProfile

```

## Self reflection

Implementing TraveLink has been a highly rewarding experience, as it provided us with the opportunity to apply the theoretical knowledge of software development we had over the first three semesters in a practical and extended timeframe, unlike many other short-term projects. Throughout the implementation phase, we faced various technical challenges that tested our problem-solving abilities and forced us to think creatively. Collaboration within our team was essential. Discussing challenges together often led to innovative solutions.

One important desicion was to integrating real-time data updates using Firebase as our database model. This required a shift in our approach compared to traditional relational models, and the additional Firebase lecture proved helped to understanding how to architect the Firebase infrastructure effectively. Another significant milestone was optimizing the app for diverse devices and screen sizes. While not all screens were perfectly suited for every resolution, this experience helped us to understand the importance of considering diverse solutions early in the project.

Overall, this implementation journey has not only strengthened our technical skills but also helped us to practice app development and effective teamwork.