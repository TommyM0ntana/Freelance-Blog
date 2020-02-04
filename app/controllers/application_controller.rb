class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :created_events

  def created_posts
    if @user.created_posts.any?
      @user.created_posts.each do |event|
        content_tag(:li, post.title)
        content_tag(:li, post.content)
        button_to 'Details', "/events/#{event.id}", method: :get
      end
    else
      content_tag(:p, 'No posts created')
    end
  end
end
