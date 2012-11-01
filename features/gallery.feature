Feature: Gallery
	Background: 
		Given the following user:
			| name | dan |
		And that user is signed in.

	Scenario: Create new gallery
		Given I am on the galleries index page.
		When I follow "New Gallery"
		And I fill in the following:
			| gallery_name | photos |
			| gallery_type | photos |
		And I press "Create Gallery"
		Then I should see "Galery Successfully Created."
		And I should see "Gallery:Photos"

	Scenario: Update Gallery
		Given the following gallery:
			| name | photos |
			| type | photos |
		And I am on that gallery's page.
		When I follow "Update Gallery"
		And I fill in the following:
			| gallery_name | photos2 |
		And I press "Update Gallery"
		Then I should see "Gallery successfully updated."
		And I should see "Gallery:Photos2"

	Scenario: Destroy gallery
		Given the following gallery:
			| name | photos |
			| type | photos |
		And I am on that gallery's page.
		When I follow "Delete Gallery"
		Then I should see "Gallery successfully deleted."

