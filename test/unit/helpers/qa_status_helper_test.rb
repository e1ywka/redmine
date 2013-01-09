require File.expand_path('../../../test_helper', __FILE__)

class CustomFieldsHelperTest < ActionView::TestCase
  include QaStatusHelper
  ISSUE_ID = 1

  def test_issue_status
    issue = Issue.find(ISSUE_ID)
    assert_not_nil issue
  end
end
