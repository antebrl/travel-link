# Usability Evaluation

In this section, we conduct a comprehensive usability evaluation of our app to ensure it meets the needs and expectations of our users. Usability evaluation is a critical step in the development process, as it helps identify areas where users may encounter difficulties, allowing us to make necessary improvements to enhance the overall user experience.

The following methods were employed in our usability evaluation:

1. Cognitive Walkthrough
2. Heuristic Evaluation 
3. Thinking Aloud Tests
4. Accessibility Check


## 1. Cognitve Walkthrough

**Goal:** To identify potential usability issues by simulating the user's thought process while performing tasks in the app.

**Process:** A usability expert empathizes with a persona, goes through a list of tasks, and checks if the user would complete them as intended.

**Questions considered:**

Will the user try and achieve the right outcome?

Will the user notice that the correct action is available to them?

Will the user associate the correct action with the outcome they 
expect to achieve?

If the correct action is performed, will the user see that progress is being made towards their intended outcome?

**Given tasks:**

The User was supposed to explore and complete the most important tasks:

- Explore activities 
    - Use search bar to find activities in Barcelona
    - Find most popular activiites in Africa
    - Find details about a activity
- Create a trip
- Add activity to trip

For detailed description of the steps check the section: [User Evaluation](user-research/user-evaluation.md)

**Results**

- The user was mostly able to complete the tasks correctly. This was primarily due to the intuitive design and the use of recurring and familiar elements, such as tapping on an activity to view its details or using the search bar or the ability to swipe between different screens.

- Another reason was the clear labeling of buttons, like "Add a new Activity." This helped users understand exactly what would happen and what they would achieve. However, the option was a little bit hidden and not very intuitive to find.

- We found that users were unclear on how to create a trip, as we used a simple button with a "+" symbol. This indicates that labeling buttons is important especially for new users.

- Users receive a notification in the snackbar indicating that e.g. an activity was successfully added. Additionally it is displayed in the activity list. This feedback helps users know they have achieved the intended outcome.

## 2. Heuristic Evaluation
In this section, we conduct a heuristic evaluation to identify potential usability issues in our app. The evaluation is based on Nielsen Norman Group's 10 Usability Heuristics for Complex Applications. This method helps us pinpoint areas where the user experience can be enhanced, ensuring our app meets the highest usability standards.

Below, you'll find a list of heuristics along with our efforts to address them effectively and some user feedback:

### List of Heuristics:

1. **Visibility of System Status**
   - To keep users informed about the current system status, our app utilizes loading spinners. These spinners indicate when a specific page or content is loading, reassuring users that their request is being processed and encouraging them to wait momentarily for results. 
   - This approach prevents users from feeling disoriented and assures them that action is being taken.

2. **Match Between System and the Real World**
    - Our app employs simple language to ensure ease of understanding for users. However, we've identified an issue related to the icons used for activities based on their categories. Some users find these icons misleading or difficult to interpret. For instance, using a fire icon to represent camping might not be universally clear. We are actively exploring clearer iconography that better aligns with user expectations and enhances comprehension.

3. **User Control and Freedom**
    - Users enjoy significant control throughout our app. Nearly every page features an arrow back button for easy navigation away from the current screen, and the navigation bar allows swift movement between different sections.
    - In response to user feedback, testers expressed a desire to explore activities across the entire country without being restricted to entering at least one category. Due to API constraints requiring at least one category selection, we've addressed this by implementing a "select all" button, that allows users to view all activity categories simultaneously when they want to explore all activity types."

4. **Consistency and Standards**
    - Overall, our app maintains consistency by using uniform colors and similar interactions, such as tapping on objects to navigate between screens. 
    - However, we have identified some areas where consistency could be improved. For example, there are variations in font size, thickness, and style across different screens. Additionally, inconsistencies exist in the implementation of elements like the tab bar, where similar but not identical designs are used. Another instance is the use of modal bottom sheets instead of new screens for certain interactions. 

5. **Error Prevention**
    - We prioritize error prevention through immediate feedback and proactive restrictions. For instance, users are unable to create a trip or activity without completing all required fields. 
    - Clear messages such as "Fill out all the required information" are displayed in areas like snackbars or directly beneath input fields. This approach ensures users are guided effectively and errors are minimized during their interactions with the app.

6. **Recognition Rather than Recall**
   - To minimize the need for users to remember details, we emphasize displaying selected choices prominently. For example, when a user inputs a country and selects categories for their search, this information is automatically displayed on the subsequent screen.

   - By making this information easily accessible and visible, users can quickly recognize and verify their selections without needing to recall them from memory. This approach enhances usability by reducing cognitive load and improving user interaction efficiency.

7. **Flexibility and Efficiency of Use**
    - While our app currently lacks many shortcuts, which could potentially maximize efficiency through task repetition, we recognize the benefits of integrating such features. 
    - One example of a shortcut we have implemented is using a search bar to find activities directly, rather than requiring users to navigate to different screen and selecting both the city and category and then searching for it in the list.

8. **Aesthetic and Minimalist design**
    - Feedback received indicates that our app generally meets aesthetic criteria, with testers appreciating its overall design. - However, some critiques have highlighted areas for improvement, such as inconsistencies in text styles on the same pages, oversized elements, excessive padding, and occasional issues with button placement. 
    - These factors can sometimes hinder usability by making buttons harder to access or causing them to blend into backgrounds of similar colors, or the necessarity to scroll more because of too big elements which compromises readability and wastes time.

9. **Help Users Recognize, Diagnose, and Recover from Errors**
    - As mentioned earlier in point 5, our app provides feedback when the user enters wrong or not sufficient data. Additionally, error notifications are shown if there are issues such as a failure to load or an empty list of activities. 
    - This proactive approach helps users understand what went wrong, diagnose the issue, and take appropriate steps to resolve it, ensuring a smoother overall experience.

10. **Help and Documentation**
    - Currently, our app does not offer documentation to assist users.Providing comprehensive documentation would empower users to navigate the app more effectively and make the most of its features.



## 3. Thinking Aloud Tests

## 4. Accessibility Check