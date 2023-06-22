class ContactMailer < ApplicationMailer
    def email_agent agent_id, first_name, last_name, email, message
        # try to load agent from agent id
        @agent = Account.find(agent_id)

        # set instance varible that contain the information => used in email body
        @first_name = first_name
        @last_name = last_name
        @email = email
        @message = message

        if @agent.present?
            mail to: @agent.email, message: "You have a new contact for Property Finder"
        end
    end
end