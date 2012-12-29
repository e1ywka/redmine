class QaStatusHookListener < Redmine::Hook::ViewListener
  render_on :ticket_testing_results, :partial => "qa_status/ticket_testing_results" 
end
