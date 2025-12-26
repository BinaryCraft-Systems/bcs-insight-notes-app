### BCS Insight Notes Application

The application will be a mobile-based application developed using the Flutter framework. It will operate on both iOS and Android platforms. The core functionality includes local data storage, task/reminder management, and note-taking. The application will not require a user login or utilize cloud-based synchronization.

#### Purpose
The purpose of this document is to specify the complete functional and non-functional requirements for the InsightNotes mobile application. InsightNotes is a simple, lightweight, and local-storage-based application designed to help users manage Tasks (To-Do), set Reminders, and organize Notes efficiently on their mobile device.

InsightNotes is a standalone mobile application. It is a self-contained system that interacts solely with the mobile device's operating system (for local storage and notifications).

#### To-do / Task Management
- Creation - Allow users to input a task title / description.
- View - Display a list of active (incomplete) tasks.
- Editing - Allow users to modify the title / description of an existing task.
- Completion Status - Tasks must have a visual indicator to show their complete or incomplete status.
- Date or Time  Picker - Provide a user interface element (date and time picker) to associate a specific date and time with a task marking it as a Reminder.
- Reminder Notification - the system must generate a local push notification on the device at the scheduled time for tasks with a set date / time.

#### Notes Management
- Creation - Allow users to input a note title and long form text body.
- View - Display a list of notes titles or previews.
- Detail View - Upon selection, display the full content of the note for reading or editing.
- Editing - Allow users to modify both the title and body of an existing note.
Data Storage
- Save / Load - All data (tasks, reminders, notes) must be automatically saved upon creation or modification and successfully loaded upon application startup.
- Isolation - Data must be stored securely within the application sandbox on the device, inaccessible to other applications.