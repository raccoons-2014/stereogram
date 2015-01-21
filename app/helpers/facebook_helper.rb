module FacebookHelper

  def share(args)
    user = FbGraph::User.me(args[:token])
    user.link!(
      link: "http://stere-o-gram.herokuapp.com/#{args[:item].class.to_s.downcase}s/",
      message: "Check out this #{args[:item].class.to_s} on Stereogram"
    )
  end
end