require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CrashDataController do

  # This should return the minimal set of attributes required to create a valid
  # CrashData. As you add validations to CrashData, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CrashDataController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all crash_data as @crash_data" do
      crash_data = CrashData.create! valid_attributes
      get :index, {}, valid_session
      assigns(:crash_data).should eq([crash_data])
    end
  end

  describe "GET show" do
    it "assigns the requested crash_data as @crash_data" do
      crash_data = CrashData.create! valid_attributes
      get :show, {:id => crash_data.to_param}, valid_session
      assigns(:crash_data).should eq(crash_data)
    end
  end

  describe "GET new" do
    it "assigns a new crash_data as @crash_data" do
      get :new, {}, valid_session
      assigns(:crash_data).should be_a_new(CrashData)
    end
  end

  describe "GET edit" do
    it "assigns the requested crash_data as @crash_data" do
      crash_data = CrashData.create! valid_attributes
      get :edit, {:id => crash_data.to_param}, valid_session
      assigns(:crash_data).should eq(crash_data)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CrashData" do
        expect {
          post :create, {:crash_data => valid_attributes}, valid_session
        }.to change(CrashData, :count).by(1)
      end

      it "assigns a newly created crash_data as @crash_data" do
        post :create, {:crash_data => valid_attributes}, valid_session
        assigns(:crash_data).should be_a(CrashData)
        assigns(:crash_data).should be_persisted
      end

      it "redirects to the created crash_data" do
        post :create, {:crash_data => valid_attributes}, valid_session
        response.should redirect_to(CrashData.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved crash_data as @crash_data" do
        # Trigger the behavior that occurs when invalid params are submitted
        CrashData.any_instance.stub(:save).and_return(false)
        post :create, {:crash_data => {}}, valid_session
        assigns(:crash_data).should be_a_new(CrashData)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CrashData.any_instance.stub(:save).and_return(false)
        post :create, {:crash_data => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested crash_data" do
        crash_data = CrashData.create! valid_attributes
        # Assuming there are no other crash_data in the database, this
        # specifies that the CrashData created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CrashData.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => crash_data.to_param, :crash_data => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested crash_data as @crash_data" do
        crash_data = CrashData.create! valid_attributes
        put :update, {:id => crash_data.to_param, :crash_data => valid_attributes}, valid_session
        assigns(:crash_data).should eq(crash_data)
      end

      it "redirects to the crash_data" do
        crash_data = CrashData.create! valid_attributes
        put :update, {:id => crash_data.to_param, :crash_data => valid_attributes}, valid_session
        response.should redirect_to(crash_data)
      end
    end

    describe "with invalid params" do
      it "assigns the crash_data as @crash_data" do
        crash_data = CrashData.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CrashData.any_instance.stub(:save).and_return(false)
        put :update, {:id => crash_data.to_param, :crash_data => {}}, valid_session
        assigns(:crash_data).should eq(crash_data)
      end

      it "re-renders the 'edit' template" do
        crash_data = CrashData.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CrashData.any_instance.stub(:save).and_return(false)
        put :update, {:id => crash_data.to_param, :crash_data => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested crash_data" do
      crash_data = CrashData.create! valid_attributes
      expect {
        delete :destroy, {:id => crash_data.to_param}, valid_session
      }.to change(CrashData, :count).by(-1)
    end

    it "redirects to the crash_data list" do
      crash_data = CrashData.create! valid_attributes
      delete :destroy, {:id => crash_data.to_param}, valid_session
      response.should redirect_to(crash_data_url)
    end
  end

end