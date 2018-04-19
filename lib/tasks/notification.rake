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

    desc "Sends email notification to managers each day to inform of pending overtime requests"
    task manager_email: :environment do
    # 1. Iterate over the pending overtime requests
    # 2. Check to see if there are any requests
    # 1. Iterate over the list of admin users/managers
    # 1. Send an email to each Admin
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end

end
