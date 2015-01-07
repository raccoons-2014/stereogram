module FacebookHelper

  def share(args)
    user = FbGraph::User.me(args[:token])
    user.link!(
      link: "http://cryptic-dusk-7305.herokuapp.com",
      message: 'I just created a Snippet on Stereogram'
    )
  end
end