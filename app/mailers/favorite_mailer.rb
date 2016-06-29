class FavoriteMailer < ApplicationMailer
  default from: "fredlazo@yahoo.com"

  def new_comment(user, post, comment)

# #18
    headers["Message-ID"] = "<comments/#{comment.id}@fast-badlands-39912.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@fast-badlands-39912.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@fast-badlands-39912.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

# #19
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
