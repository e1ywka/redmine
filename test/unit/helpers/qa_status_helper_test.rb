require File.expand_path('../../../test_helper', __FILE__)

class QaStatusHelperTest < ActionView::TestCase
  include QaStatusHelper

  def test_issue_status
    principal = User.new
    principal.firstname = "User_firstname"
    principal.lastname = "User_lastname"
  
    status = IssueStatus.new 
    status.name = "status name"

    issue = Issue.new
    issue.tracker_id = 1
    issue.project_id = 1
    issue.subject = "Issue 1"
    issue.status = status
    issue.assigned_to = principal

    puts issue.custom_field_values
    assert_equal "User_firstname User_lastname, status name", issue_status(issue)
  end
end
