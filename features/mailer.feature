Feature: Mailer
	Scenario: visitor submits e-mail
		Given I am on the contact page
		When I fill in the following:
			| email | dan.bearl@gmail.com |
			| subject | test |
			| body | This is an email |
		And I press "Contact"
		Then I should see "Message successfully sent."
