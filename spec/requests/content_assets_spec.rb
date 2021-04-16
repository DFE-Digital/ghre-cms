require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/content_assets", type: :request do
  # ContentAsset. As you add validations to ContentAsset, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryBot.attributes_for(:content_asset)
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  describe "GET /index" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:user)

      ContentAsset.create! valid_attributes
      get content_assets_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:user)

      content_asset = ContentAsset.create! valid_attributes
      get content_asset_url(content_asset)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:user)

      get new_content_asset_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      sign_in FactoryBot.create(:user)

      content_asset = ContentAsset.create! valid_attributes
      get edit_content_asset_url(content_asset)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ContentAsset" do
        sign_in FactoryBot.create(:user)

        expect {
          post content_assets_url, params: { content_asset: valid_attributes }
        }.to change(ContentAsset, :count).by(1)
      end

      it "redirects to the created content_asset" do
        sign_in FactoryBot.create(:user)

        post content_assets_url, params: { content_asset: valid_attributes }
        expect(response).to redirect_to(content_asset_url(ContentAsset.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ContentAsset" do
        sign_in FactoryBot.create(:user)

        expect {
          post content_assets_url, params: { content_asset: invalid_attributes }
        }.to change(ContentAsset, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post content_assets_url, params: { content_asset: invalid_attributes }
        expect(response).to be_successful
      end
    end

    context "when the rate limit is exceeded" do
      it "will not create two ContentAssets within 30 seconds of each other" do
        sign_in FactoryBot.create(:user)

        expect {
          post content_assets_url, params: { content_asset: valid_attributes }

          other_valid_attributes = FactoryBot.attributes_for(:content_asset)
          post content_assets_url, params: { content_asset: other_valid_attributes }
        }.to change(ContentAsset, :count).by(1)
        # ie change by only 1, not 2, I could not get to_not working with change
      end

      it "redirects to the created content_asset" do
        sign_in FactoryBot.create(:user)

        post content_assets_url, params: { content_asset: valid_attributes }
        expect(response).to redirect_to(content_asset_url(ContentAsset.last))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested content_asset" do
        content_asset = ContentAsset.create! valid_attributes
        patch content_asset_url(content_asset), params: { content_asset: new_attributes }
        content_asset.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the content_asset" do
        content_asset = ContentAsset.create! valid_attributes
        patch content_asset_url(content_asset), params: { content_asset: new_attributes }
        content_asset.reload
        expect(response).to redirect_to(content_asset_url(content_asset))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        content_asset = ContentAsset.create! valid_attributes
        patch content_asset_url(content_asset), params: { content_asset: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested content_asset" do
      sign_in FactoryBot.create(:user)

      content_asset = ContentAsset.create! valid_attributes
      expect {
        delete content_asset_url(content_asset)
      }.to change(ContentAsset, :count).by(-1)
    end

    it "redirects to the content_assets list" do
      sign_in FactoryBot.create(:user)

      content_asset = ContentAsset.create! valid_attributes
      delete content_asset_url(content_asset)
      expect(response).to redirect_to(content_assets_url)
    end
  end
end
