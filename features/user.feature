Feature: User
	Scenario: user signs in
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
		And I am on the sign in page
		When I fill in the following:
			| email    | user@example.com |
			| password | pass             |
		And I press "Sign In"
		Then I should see "Successfully signed in."

	Scenario: user signs out
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
		And that user is signed in.
		And I am on the home page
		When I follow "Sign Out"
		Then I should see "User signed out successfully."
