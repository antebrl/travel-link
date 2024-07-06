## User Scenarios
!!! abstract "Discover activities, meet new people"
	**Steve** wants to go on vacation, but his friends are unavailable. He's keen on visiting Barcelona but isn't enthusiastic about traveling alone. So, he picks up his phone and searches for public group trips to Barcelona using an app. He explores the app for activities in Barcelona, and potential travel companions, communicating with them via chat in the app.

!!! abstract "Plan and organize a trip"
	**Steffi** and her friends are planning a vacation but haven't decided on a destination yet. They search for fun activities in various travel destinations. After deliberation, they settle on London and create a private trip within the app. To ensure a smooth trip, they meticulously plan every aspect through the app, including selecting activities, organizing expenses, and creating checklists. Each friend actively participates in the trip planning process via the app. During their vacation, they use the app to collectively store pictures taken in London as shared memories.

!!! abstract "Publish activities and conduct tours"
	**Rudi**, an experienced tour guide familiar with local activities and attractions in London, shares his knowledge by posting these activities within the app. On Saturdays, he conducts guided tours of London. To organize these tours efficiently, he creates private trips within the app and invites the participants. Using the app, he facilitates communication and decision-making among participants, also providing a platform for sharing information and photos taken during the tour.

## MVP
In this analysis we evaluate our features from the perspective of three selected users.
Besides the interviewees, we also selected [Julian](nzse-user-research.md#3-create-matrix) for this statistic because he is one of the survey participants who is average in all of our user-specific categories. This makes him a primary target user for our app.
Take also a look at the [survey evaluation of the features](survey-evaluation.md#feature-analysis).

|  | [Sebastian](personas.md##__tabbed_1_1)(30%) | [Samuel](personas##__tabbed_1_2)(20%) | [Julian](nzse-user-research.md#3-create-matrix)(50%) |  | [Survey results](survey-evaluation.md#feature-analysis) | Our app implementation progress |
| :------ | :---------: | :------: | :------: | :------ | :------: | ------: |
| Organizing Expenses | -1 | 2 | 1 | 60 | 4.06 | ❌[^1] |
| Discover Activities | 2 | -1 | 2 | 140 | 3.76 | ✅ |
| Chat | 0 | 1 | 2 | 120 | 3.74 | ✅ |
| Shared Checklists | 1 | 2 | 1 | 170 | 3.62 | ✅ | 
| Shared Gallery | 1 | 0 | 2 | 130 | 3.52 | ✅ |
| Weather for travel period | 2 | 1 | 1 | 130 | 3.52 | ❌ |
| Activity assignment to trip | 2 | 1 | 1 | 130 | 3.52 | ✅ |
| Integrated Map | 2 | 0 | 1 | 110 | 3.33 | ✅ |
| Archiving past trips | 1 | -1 | 1 | 60 | 3.33 | ✅ |
| Transportation Details | 1 | -1 | 0 | 10 | 3.05 | ❌ |
| Store Travel documents | 1 | 1 | -1 | 0 | 2.95 | ❌ |
| Polls | 0 | 0 | 0 | 0 | 2.81 | ❌ |


> The analysis shows a certain similarity between the MVP from personas ranking and the survey results. Since the survey represents a larger group of important users, it will be used as the basis for selecting the features.

[^1]: Shared Expenses is a planned feature. But we decided to priotize other features, because they are essential for our vision and assigning expenses can also be done within the shared checklist feature: Create a group checklist item "Pay 10$ to Ante" and assign it someone.

## Vision Statement
For **group travelers**, <br>
Who are **overwhelmed** by trip planning complexities <br>
Our travel-app is a **comprehensive travel organization tool** <br>
That makes planning a group trip **easier** and **faster**. <br>
Setting us apart from widespread apps like Expedia with integrated **collaboration** features, <br>
Bringing ease and unity to every adventure.