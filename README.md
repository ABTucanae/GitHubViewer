# GitHub Viewer iOS app

## How to run
Once you have downloaded the repo, please navigate to the API_TOKEN entry of the User-Defined Build Settings and replace the text to the right with your own token.
The location is highlighted in blue in the below screenshot.

<img width="800" alt="Screenshot 2025-05-12 at 21 30 34" src="https://github.com/user-attachments/assets/1d54a2e0-3239-4b6e-88d1-da7741e7b9a8" />

## Technical Decisions
The app was created using SwiftUI with MVVM as the architecture. It uses async/await instead of closures or delegates for asynchronous calls, as well as Swift Testing as the unit testing framework.

Reasons:
- Since this is a modern project, it makes sense to use modern features where possible for longevity.
- Even though the scale of the project is small, SwiftUI and Swift Testing speed up development.
- Using async/await leads to much cleaner code, as well as clean integration with Swift Testing.
- A more complex architecture would be harder to follow for a project of this size.

## Design Goals
The primary goals were to make the code clear, reusable, and easily testable:
- Clear code: Types are focused on simple tasks with semantic naming. Views are broken down into small logical components.
- Reusability & Testability: Protocol-oriented programming is used where decoupling is feasible (e.g. services and networking). This enabled the use of lightweight stubs in unit tests, minimizing moving parts. URLSession was even abstracted behind a simple protocol to enable easy testing of the ApiClient class.

## Areas for improvement
Although the following weren't required, they could be added as improvements for a production app:
- Pull to refresh
- Pagination
- Error handling is currently implemented as an alert, but a custom error screen would be better.
- Error types could be handled differently. Being able to offer a different experience based on fatal vs non fatal errors could lead to a better user experience.

Thank you for reading this and for checking out the project!
