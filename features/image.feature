Feature: Image
	Scenario: create image
		Given the following user:
			| name     | user |
			| password | pass |
		And that user is signed in.
		And the following gallery:
			| name | photos |
			| type | photos |
		And I am on that gallery's page.
		When I follow "Add New Photo"
		And I fill in the following:
			| image_title | Photo #1 |
			| image_url   | url      |
			| image_type  | photo    |
		And I press "Create Image"
		Then I should see "Image successfully created."
		And I should see "Photos:Photo #1"

	Scenario: update image
		Given the following user:
			| name     | user |
			| password | pass |
		And that user is signed in.
		And the following image:
			| title | Photo #1 |
			| url   | url      |
			| type  | photo    |
		And I am on that image's page.
		When I follow "Update"
		And I fill in the following:
			| image_title | Photo #2 |
		And I press "Update Image"
		Then I should see "Image successfully updated."
		And I should see "Photo #2"

	Scenario: Move image
		Given the following user:
			| name     | user |
			| password | pass |
		And that user is signed in.
		And the following gallery:
			| name | photos |
			| type | photo  |
			| id   | 1      |
		And the following gallery:
			| name | paintings |
			| type | painting  |
			| id   | 2         |
		And the following image:
			| title      | slattern |
			| type       | painting |
			| gallery_id | 1        |
		And I am on that image's page.
		When I follow "Move Image"
		And I select the following:
			| image_gallery | paintings |
		And I press "Move Image"
		Then I should see "Image successfully moved."
		And I should see "Paintings:Slattern"

	Scenario: Destroy image
		Given the following user:
			| name     | user |
			| password | pass |
		And that user is signed in.
		And the following image:
			| title | photo #1 |
			| type  | photo    |
		And I am on that image's page.
		When I follow "Delete"
		Then I should see "Image successfully deleted."


