# To deliver this notification:
#
# CommentNotification.with(task: @task).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # def to_database
  #   {
  #     type: self.class.name,
  #     params: params,
  #     account: Current.account,
  #   }
  # end

  # def to_action_cable
  #   {
  #     type: self.class.name,
  #     params: params,
  #     account: Current.account,
  #   }
  # end

  # Add required params  #
  param :task

  # Define helper methods to make rendering easier.
  #
  def message
    "'#{params[:task].title}' was due on #{params[:task].date.strftime("%d %B")}"
  end

  def url
    edit_task_path(params[:task])
  end
end
