require 'rails_helper'

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

RSpec.describe LineItemsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # LineItem. As you add validations to LineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all line_items as @line_items" do
      line_item = LineItem.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:line_items)).to eq([line_item])
    end
  end

  describe "GET #show" do
    it "assigns the requested line_item as @line_item" do
      line_item = LineItem.create! valid_attributes
      get :show, {:id => line_item.to_param}, valid_session
      expect(assigns(:line_item)).to eq(line_item)
    end
  end

  describe "GET #new" do
    it "assigns a new line_item as @line_item" do
      get :new, {}, valid_session
      expect(assigns(:line_item)).to be_a_new(LineItem)
    end
  end

  describe "GET #edit" do
    it "assigns the requested line_item as @line_item" do
      line_item = LineItem.create! valid_attributes
      get :edit, {:id => line_item.to_param}, valid_session
      expect(assigns(:line_item)).to eq(line_item)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new LineItem" do
        expect {
          post :create, {:line_item => valid_attributes}, valid_session
        }.to change(LineItem, :count).by(1)
      end

      it "assigns a newly created line_item as @line_item" do
        post :create, {:line_item => valid_attributes}, valid_session
        expect(assigns(:line_item)).to be_a(LineItem)
        expect(assigns(:line_item)).to be_persisted
      end

      it "redirects to the created line_item" do
        post :create, {:line_item => valid_attributes}, valid_session
        expect(response).to redirect_to(LineItem.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved line_item as @line_item" do
        post :create, {:line_item => invalid_attributes}, valid_session
        expect(assigns(:line_item)).to be_a_new(LineItem)
      end

      it "re-renders the 'new' template" do
        post :create, {:line_item => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => new_attributes}, valid_session
        line_item.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested line_item as @line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        expect(assigns(:line_item)).to eq(line_item)
      end

      it "redirects to the line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => valid_attributes}, valid_session
        expect(response).to redirect_to(line_item)
      end
    end

    context "with invalid params" do
      it "assigns the line_item as @line_item" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => invalid_attributes}, valid_session
        expect(assigns(:line_item)).to eq(line_item)
      end

      it "re-renders the 'edit' template" do
        line_item = LineItem.create! valid_attributes
        put :update, {:id => line_item.to_param, :line_item => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested line_item" do
      line_item = LineItem.create! valid_attributes
      expect {
        delete :destroy, {:id => line_item.to_param}, valid_session
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      line_item = LineItem.create! valid_attributes
      delete :destroy, {:id => line_item.to_param}, valid_session
      expect(response).to redirect_to(line_items_url)
    end
  end

  describe "updating lineitem in cart" do

    it "should update the lineitem" do
      @line_item = LineItem.create! valid_attributes
      patch :update, id: @line_item, line_item: { product_id: @line_item.product_id }
      response.should redirect_to line_item_path(assigns(:line_item))
    end
  end

end
