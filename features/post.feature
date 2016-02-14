Feature: Post
	Scenario: Create post
		Given the following user:
			| email                 | user@example.com |
			| password              | pass |
      | password_confirmation | pass |
    And that user is signed in.
		And I am on the posts index.
		When I follow "New Post"
		And I fill in the following:
			| post_title | first post             |
			| post_body  | this is the first post |
		And I press "Create Post"
		Then I should see "Post successfully created."
		And I should see "this is the first post"

	Scenario: update post
		Given the following user:
			| email                 | user@example.com |
			| password              | pass |
      | password_confirmation | pass |
    And that user is signed in.
		And the following post:
			| title | first post             |
			| body  | this is the first post |
		And I am on the posts index.
		When I follow "Edit"
		And I fill in the following:
			| post_body | This is the updated body. |
		And I press "Update Post"
		Then I should see "Post successfully updated."
		And I should see "This is the updated body."

	Scenario: Destroy post
		Given the following user:
			| email                 | user@example.com |
			| password              | pass |
      | password_confirmation | pass |
    And that user is signed in.
		And the following post:
			| title | first post |
			| body  | test       |
		And I am on the posts index.
		When I follow "Delete"
		Then I should see "Post successfully deleted."

