Feature: Image
	Scenario: create image
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
		And that user is signed in.
		And the following gallery:
			| name     | photos |
			| category | photos |
		And I am on that gallery's page.
		When I follow "New Image"
		And I fill in the following:
			| image_title    | Photo #1 |
			| image_category | photo    |
		And I press "Create Image"
		Then I should see "Image successfully created."
    And I should see "photos::Photo #1"

	Scenario: update image
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
		And that user is signed in.
		And the following image:
			| title    | Photo #1 |
			| category | photo    |
		And I am on that image's page.
		When I follow "Edit"
		And I fill in the following:
			| image_title | Photo #2 |
		And I press "Update Image"
		Then I should see "Image successfully updated."
		And I should see "Photo #2"

	Scenario: Move image
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
		And that user is signed in.
		And the following gallery:
			| name     | photos |
			| category | photo  |
			| id       | 1      |
		And the following gallery:
			| name     | paintings |
			| category | painting  |
			| id       | 2         |
		And the following image:
			| title      | slattern |
			| category   | painting |
			| gallery_id | 1        |
		And I am on that image's page.
		When I follow "Edit"
		And I select the following:
			| image_gallery_id | paintings |
		And I press "Update Image"
		Then I should see "Image successfully updated."
    And I should see "paintings::slattern"

	Scenario: Destroy image
		Given the following user:
			| email                 | user@example.com |
			| password              | pass             |
      | password_confirmation | pass             |
		And that user is signed in.
		And the following image:
			| title    | photo #1 |
			| category | photo    |
		And I am on that image's page.
		When I follow "Delete"
		Then I should see "Image successfully deleted."


