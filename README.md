# Background Generator: AI Usecase Proposal

This is a proposal for a simple AI tool to generate background images for our app and content admin.

## The Problem

In our "Inspiration" feature, admins choose background images for quotes. Sometimes, the image color and text color are too similar. This makes the text hard to read. It is not very pelasant for the users.

## My Solution

I made a simple app to fix this. It uses AI to create background images that are "dark" or "light". This makes sure the text is always easy to read.

It works on macOS and iOS for our admins.

## How it Works

1.  **Type the context you want**: For example, "city at night", "cabin in the woods" or anything you imagine.
2.  **Choose theme**: "Dark" or "Light".
3.  **Negative Prompts**: Add the things not to include in the image.
4.  **Generate**: The app makes the image using an AI service.

This fixes the problem of bad theme-mismatched backgrounds.

## Future Ideas

The best idea is to put this tool inside our main app.

*   **Personalized "Inspiration"**: Let users make their own backgrounds for "Inspiration" and "Greeting Messages" before they share. They can use our "Amplify" feature to export the image.

*   **Enhanced "Amplify" Exports**: When users create content of "Inspiration", "Greetings" or anything through "Amplify" share sheet, they can modify the final result's background image as a custom, unique and personalized image.

*   **Use Local AI**: For the Mac app that admins use, we can run the AI model on the computer itself. This can be faster and cheaper.

This project is a demo to show how AI can make our app better.

## Demo

<video src="demo.m4v" controls width="800"></video>
