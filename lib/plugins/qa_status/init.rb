require 'redmine'

# This is the important line.
# It requires the file in lib/my_plugin/hooks.rb
require_dependency 'lib/plugins/qa_status/qa_status_hook_listener'

Redmine::Plugin.register :ticket_testing_results do

end
