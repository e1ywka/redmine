require File.expand_path('../../../test_helper', __FILE__)

class CustomFieldsHelperTest < ActionView::TestCase
  include QaStatusHelper
  ISSUE_ID

  def test_issue_status
    qaHelper = QaStatusHelper.new
    issue = Issue.find(ISSUE_ID)
  end
end
