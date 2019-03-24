require 'rails_helper'

RSpec.describe '/en/backend', type: :feature do
  include ActionView::RecordIdentifier

  let(:administrador_root_path) { '/en/backend' }
  let(:engine) { Administrador::Configuration.engines['News::Backend::Engine'] }
  let(:resource_class) { News::Item }
  let(:base_path) { '/news-backend/items' }
  let(:resource) { create(:news_item) }
  let(:resources) { create_list(:news_item, 3) }
  let(:show_path) { "#{base_path}/#{resource.to_param}"}

  describe 'index' do
    before(:each) do
      resources
      visit(administrador_root_path)
      within("##{dom_id(engine)}") { click_link(resource_class.model_name.human(count: :other)) }
    end

    it { expect(page.status_code).to eq(200) }
    it { expect(current_path).to eq(base_path) }
    it { within('.collection-table') { resources.map { |r| expect(page.body).to have_css("##{dom_id(r)}") } } }
  end

  describe 'show' do
    before(:each) do
      resource
      visit(administrador_root_path)
      within("##{dom_id(engine)}") { click_link(resource_class.model_name.human(count: :other)) }
      within('#item_1-actions') { find(".show").click }
    end

    it { expect(page.status_code).to eq(200) }
    it { expect(current_path).to eq(show_path) }
    it { expect(page.body).to have_css("##{dom_id(resource)}-resource-table") }
  end

  describe 'destroy' do
    let(:success_message) { I18n.t('flash.actions.destroy.notice', resource_name: resource.class.model_name.human) }

    before(:each) do
      resource
      visit(administrador_root_path)
      within("##{dom_id(engine)}") { click_link(resource_class.model_name.human(count: :other)) }
      within('#item_1-actions') { find(".destroy").click }
    end
    it { expect(page.status_code).to eq(200) }
    it { expect(current_path).to eq(base_path) }
    it { expect(page.body).to have_text(success_message) }
  end
end