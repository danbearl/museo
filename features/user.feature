Feature: User
	Scenario: user signs in
		Given the following user:
			| name     | user |
			| password | pass |
		And I am on the sign in page
		When I fill in the following:
			| user_name     | user |
			| user_password | pass |
		And I press "Sign In"
		Then I should see "Welcome User"
		And I should see "Successfully signed in."

	Scenario: user signs out
		Given the following user:
			| name     | user |
			| password | pass |
		And that user is signed in.
		And I am on the admin page
		When I follow "Sign Out"
		Then I should see "User signed out successfully."

