require 'rails_helper'

RSpec.describe '/en/backend', type: :feature do
  include ActionView::RecordIdentifier

  let(:administrador_root_path) { '/en/backend' }
  let(:engine) { Administrador::Configuration.engines['News::Backend::Engine'] }
  let(:resource_class) { News::Item }
  let(:base_path) { '/news-backend/items' }

  describe 'index' do
    before(:each) do
      visit(administrador_root_path)
      within("##{dom_id(engine)}") { click_link(resource_class.model_name.human(count: :other)) }
    end

    it { expect(page.status_code).to eq(200) }
    it { expect(current_path).to eq(base_path) }
  end
end