module ApplicationHelper
  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('DISLIKE!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('LIKE', post_likes_path(post_id: post.id), method: :post)
    end
  end
end
