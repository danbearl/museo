Feature: Gallery
	Background: 
		Given the following user:
			| email                 | user@example.com |
      | password              | pass             |
      | password_confirmation | pass             |
		And that user is signed in.

	Scenario: Create new gallery
		Given I am on the galleries index page.
		When I follow "New Gallery"
		And I fill in the following:
			| gallery_name     | photos |
			| gallery_category | photos |
		And I press "Create Gallery"
		Then I should see "Gallery successfully created."
		And I should see "photos"

	Scenario: Update Gallery
		Given the following gallery:
			| name     | photos |
			| category | photos |
		And I am on that gallery's page.
		When I follow "Edit Gallery"
		And I fill in the following:
			| gallery_name | photos2 |
		And I press "Update Gallery"
		Then I should see "Gallery successfully updated."
		And I should see "photos2"

	Scenario: Destroy gallery
		Given the following gallery:
			| name     | photos |
			| category | photos |
		And I am on that gallery's page.
		When I follow "Delete Gallery"
		Then I should see "Gallery successfully deleted."

