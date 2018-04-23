namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime if they have any"
  task sms: :environment do
    #if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the OT management dashboard to request OT or confirm your hours for last week: https://geo-overtime-tracker.herokuapp.com/"  	
        employees.each do |employee|
          AuditLog.create!(user_id: employee.id)
      	 	SmsTool.send_sms(number: employee.phone , message: notification_message)
      	end
    #end
  end 

	###

  	# number: "5555555555"
  	# No spaces or dashes
  	# exactly 10 characters
  	# all characters have to be a number

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




