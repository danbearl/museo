Feature: Page
	Scenario: Create page
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
    And that user is signed in.
		And I am on the home page
		When I follow "Create Page"
		And I fill in the following:
			| page_name     | About                  |
			| page_body     | This is the about page |
			| page_priority | 1                      |
		And I press "Create Page"
		Then I should see "Page successfully created."
		And I should see "About"

	Scenario: Update page
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
    And that user is signed in.
		And the following page:
			| name     | about                  |
			| body     | This is the about page |
			| priority | 1                      |
		And I am on that page.
    When I follow "edit"
		And I fill in the following:
			| page_body | This is the updated body. |
		And I press "Update Page"
		Then I should see "Page successfully updated."
		And I should see "This is the updated body."

	Scenario: Destroy page
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
    And that user is signed in.
		And the following page:
			| name     | about                   |
			| body     | This is the about page. |
			| priority | 1                       |
		And I am on that page.
		When I follow "delete"
		Then I should see "Page successfully deleted."
			
