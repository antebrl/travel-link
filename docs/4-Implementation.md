# Implementation
Document your app with a rough [class diagram in mermaid]()

``` mermaid
classDiagram
    note "From Duck till Zebra"
    Animal <|-- Duck
    note for Duck "can fly\ncan swim\ncan dive\ncan help in debugging"
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +String gender
    Animal: +isMammal()
    Animal: +mate()
    class Duck{
        +String beakColor
        +swim()
        +quack()
    }
    class Fish{
        -int sizeInFeet
        -canEat()
    }
    class Zebra{
        +bool is_wild
        +run()
    }
```




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
        +String[] interests
        +String[] languages
        +String city
        +String publicName
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




