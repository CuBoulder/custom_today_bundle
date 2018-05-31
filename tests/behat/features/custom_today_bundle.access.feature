@custom_today_bundle
Feature: Taxonomy Edit Disable

        When I login to a Web Express website
    As an authenticated user with the right permission
    I should be able to disable a taxonomy term

    Scenario Outline: An authenticated user should be able to access the form for disabling a taxonomy term
        Given  I am logged in as a user with the <role> role
        When I go to "admin/config/user-interface/taxonomy-edit-disable"
        Then I should see <message>

        Examples:
            | role            | message                 |
            | edit_my_content | "Access Denied"         |
            | edit_only       | "Access Denied"         |
            | content_editor  | "Access Denied"         |
            | site_owner      | "Access Denied"         |
            | administrator   | "Taxonomy Edit Disable" |
            | developer       | "Taxonomy Edit Disable" |

    Scenario: An anonymous user should not be able to access the form for disabling a taxonomy term
        When I am on "admin/config/user-interface/taxonomy-edit-disable"
        Then I should see "Access denied"