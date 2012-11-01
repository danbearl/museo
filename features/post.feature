Feature: Post
	Scenario: Create post
		Given the following user:
			| name     | user |
			| password | pass |
		And I am on ths posts index.
		When I follow "New Post"
		And I fill in the following:
			| post_title | first post             |
			| post_body  | this is the first post |
		And I press "Create Post"
		Then I should see "Post successfully created."
		And I should see "this is the first post"

	Scenario: update post
		Given the following user:
			| name     | user |
			| password | pass |
		And the following post:
			| title | first post             |
			| body  | this is the first post |
		And I am on that post's page.
		When I follow "Edit"
		And I fill in the following:
			| post_body | This is the updated body. |
		And I press "Update Post"
		Then I should see "Post successfully updated."
		And I should see "This is the updated body."

	Scenario: Destroy post
		Given the following user:
			| name     | user |
			| password | pass |
		And the following post:
			| title | first post |
			| body  | test       |
		And I am on that post's page.
		When I follow "Delete"
		Then I should see "Post successfully deleted."

