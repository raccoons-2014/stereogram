module FacebookHelper

  def share(args)
    user = FbGraph::User.me(args[:token])
    user.link!(
      link: "http://stere-o-gram.herokuapp.com/",
      message: 'I just created a Snippet on Stereogram'
    )
  end
end