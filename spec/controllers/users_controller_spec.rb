require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  subject(:user) { User.create(username: 'bob', password: 'password')}
  describe 'get#new' do
    it 'renders new'do
      get :new, params: { user: {} } # in case we render partials
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'get#show' do
    it 'redirects to user\'s #show' do
      get :show, params: { id: user.id }

      expect(response).to redirect_to(user_url(user.id))
    end
    it 'throws an error for non-existent id' do
      begin
        get :show, params: { id: -1 }
      rescue
        ActiveRecord::RecordNotFound
      end
      expect(response).not_to render_template(:show)
    end
  end

  describe 'post#create' do
    describe 'invalid creds' do
      it 'flashes error and renders new' do
        post :create, params: { user: {username: 'bob', password: 'bob'} }
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    describe 'valid creds' do
      it 'should redirect user\'s page' do
        post :create, params: { user: {username: 'blob', password: 'password'} }
        expect(response).to redirect_to(user_url(User.last))
        expect(response).to have_http_status(302)
      end
    end
  end
end
