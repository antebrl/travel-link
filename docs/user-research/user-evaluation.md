``` mermaid
flowchart LR
    subgraph subgraph1[Create your own Trip]
        direction LR
        top1[Create trip] --> bottom1[Invite friends]
    end

    
      subgraph sub2[Plan the Trip]
         direction TB
         top2[Chat] -.-> bottom4[Explore and add activities] -.-> bottom3[Use checklist] -.-> bottom5[Show map] -.-> bottom2[Save and share pictures]        
      end
    
    su[Register] --> subgraph1
    subgraph1 --> sub2
    su[Register] --> outside2[Join trip]
    outside2 --> sub2
```



## 1. Register
**Scenario**: You want to use the personalized features of the app. Register an account.

- [ ] Go to Register Page
- [ ] Register with email and password

## 2. Edit your profile
**Scenario**:  You want to change your own appearance. Edit your public profile. At least change your profile picture, name and description.

- [ ] Navigate profile page
- [ ] Edit your public profile picture, name and description
- [ ] (optional) Set languages and interests

## 3. Create a Trip
**Scenario**: You are planning a new group trip for the upcoming holiday season. Create a new private trip and verify that it appears in your list of trips.

- [ ] Create a new trip
    * [ ] Set name and description
    * [ ] Choose private
    * [ ] Search and select destination
    * [ ] Select date range (optional)

## 4. Invite Friends
**Scenario**: You need to invite your friends to the trip. Search for them by their username, view their public profile and invite them to your created trip.

- [ ] Go to trips details page
- [ ] Find page to add participants
- [ ] Search for the friends account by username and view their public profile
- [ ] Invite them to the trip

## 5. Join a public trip
**Scenario**: You don't have any fellow travelers for your adventure trip and want to join or create a publicly organized trip. Query public trips and join one.

- [ ] Navigate public trips page
- [ ] Filter the public trips by destination and time intervall
- [ ] Explore the selection of public trips by sliding
- [ ] Select one, inspect it and join it


## 6. Chat with your friends
**Scenario**: You need to discuss some plans with your friends of the trip you created. Find the trip where you need to chat with participants and join the chatroom to start a discussion.

- [ ] Go to trips details page
- [ ] Navigate to the chat
- [ ] Send a message

## 7. Add activities to your trip
**Scenario**: You have planned a new activity for your upcoming trip and need to add it to your trips itinerary. Add a new activity at your destination to your trip.

- [ ] Navigate to the activity page
- [ ] search for location by name or by exploring continents
- [ ] filter by categories
- [ ] Look at the details of a activity
- [ ] Add the activity to your trip

## 8. Add Elements to a Checklist
**Scenario**: You need to prepare for an upcoming trip by organizing tasks in a checklist. Find the checklist for a specific trip, add a new group task, and mark some tasks as completed.

- [ ] Navigate to a trips checklist page
- [ ] Add a group task
- [ ] Assign participants
- [ ] Mark a task as completed in your personal view

## 9. View Activities on the Map
**Scenario**: You want to review the activities planned for your trip and see them on a map. Navigate to the map screen, locate an agreed-upon activity, and interact with it.

- [ ] Navigate to the map screen of a trip
- [ ] Click on a activity icon to see a preview
- [ ] Click on a participant icon to see a preview

## 10. Save Memories in the Shared Gallery
**Scenario**: You want to save and share memories from your trip in a shared gallery. Upload a photo to the shared gallery linked to your trip.

- [ ] Navigate to shared gallery tab of a trip
- [ ] Inspect existing pictures
- [ ] Post a picture to the gallery with custom desription
