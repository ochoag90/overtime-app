namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime if they have any"
  task sms: :environment do
  	# 1.  Schedule to run on Sunday @ 5 PM
  	# 2.  Iterate over all employees
  	# 3.  Skip admin users
  	# 4.  Send a message that has instructions and a link to log time
  	# User.all.each do |user|
  	# 	SmsTool.send_sms{}
  	# end

	###

  	# number: "5555555555"
  	# No spaces or dashes
  	# exactly 10 characters
  	# all characters have to be a number

  end

end
