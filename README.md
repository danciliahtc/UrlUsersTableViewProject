---

# UrlUsersTableViewProject

This project demonstrates how to fetch a list of users from a remote API and display them in a table view using **UIKit**. It leverages `URLSession` for data fetching and `JSONDecoder` for decoding the JSON response. The user data is displayed in a custom table view cell with various user details, including name, email, username, phone number, and company name.

## Features

- **API Integration**: Fetches a list of users from `https://jsonplaceholder.typicode.com/users` using a network request.
- **Table View**: Displays the fetched user data in a `UITableView` with custom table view cells.
- **Custom Table View Cell**: Each table view cell is configured to display the user's name, username, email, phone number, and company.
- **Error Handling**: Implements error handling to manage network failures and decoding issues.

## Project Structure

### Files

- **`LocalDataManager.swift`**: Manages the network request to fetch user data from the API and decodes the JSON response into an array of `User` objects.
- **`UrlUsersTableViewCell.swift`**: Custom table view cell that displays the user's name, username, email, phone, and company.
- **`UrlUsersViewController.swift`**: The main view controller that handles the table view and integrates the network manager to load data into the view.
- **`User.swift`**: Defines the `User`, `Address`, `Geo`, and `Company` structs to model the user data.

### Key Concepts

- **Networking with URLSession**: Fetching data from a remote API using `URLSession` and handling errors effectively.
- **Decoding JSON**: The app uses `JSONDecoder` to decode the JSON response into Swift model objects.
- **UIKit TableView**: Displays a dynamic list of user data in a `UITableView`.
  
## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/username/UrlUsersTableViewProject.git
   ```

2. Open the `.xcodeproj` file in Xcode.

3. Build and run the app on a simulator or device.

## Usage

Upon launching the app, the `UrlUsersViewController` will load user data from the remote API and display it in a table view. Each cell shows the following user information:
- **Name**
- **Username**
- **Email**
- **Phone**
- **Company Name**

## Error Handling

If there is an issue with fetching the data (e.g., incorrect URL, network error, or decoding issue), the app will print an error message in the console. You can expand this functionality to display an error message to the user if needed.

## Contributing

Feel free to fork this repository, make improvements, or contribute by submitting a pull request.

---

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---
