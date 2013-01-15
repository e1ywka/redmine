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

  def test_relates_to_testers_method_params
    issue = Issue.new
    issue.tracker_id = 1
    issue.project_id = 1
    issue.subject = "Issue 1"

    assert_nil relates_to_testers(issue, :tracker_name => "Some name")

    tracker = Tracker.new
    tracker.name = "Some name"

    issue2 = Issue.new
    issue2.tracker = tracker
    issue2.project_id = 1
    issue2.subject = "Issue 2"

    issue_relation = IssueRelation.new
    issue_relation.issue_from = issue
    issue_relation.issue_to = issue2

    issue.relations_to.push issue_relation
    assert_not_nil relates_to_testers(issue, :tracker_name => "Some name", :custom_field_name => "Some field name")
  end

  def test_relates_to_testers_correct_ticket
    issue = Issue.new
    issue.tracker_id = 1
    issue.project_id = 1
    issue.subject = "Issue 1"

    tracker = Tracker.new
    tracker.name = "Some name"

    issue2 = Issue.new
    issue2.tracker = tracker
    issue2.project_id = 1
    issue2.subject = "Issue 2"

    issue_relation = IssueRelation.new
    issue_relation.issue_from = issue
    issue_relation.issue_to = issue2

    issue.relations_to.push issue_relation
    searched_issue = relates_to_testers(issue, :tracker_name => "Some name", :custom_field_name => "Some field name")
    assert_not_nil searched_issue
    assert !searched_issue.kind_of?(Array)
    assert issue2 == searched_issue
  end
end
