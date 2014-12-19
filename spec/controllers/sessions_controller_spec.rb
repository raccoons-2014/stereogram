



  describe 'Create' do
    it 'allows you to create a user' do
    expect{
      post :create, user: attributes_for(:user,first_name:"Zahid",last_name:"Jethani",provider:"stereogram",uid: "1234", profile_img_url: "abc.jpg")
    }
    end
  end


