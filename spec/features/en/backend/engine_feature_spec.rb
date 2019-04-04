require 'rails_helper'

RSpec.describe '/en/backend', type: :feature do
  include ActionView::RecordIdentifier

  let(:base_path) { '/en/backend' }
  let(:engine) { Administrador::Configuration.engines['Blorgh::Engine'] }

  describe 'engine in sidebar' do
    before(:each) { visit(base_path) }

    it { within('#sidebar-engines') { expect(page.body).to have_css('.administrador-engine-name', text: I18n.t("classes.#{engine.name.underscore}")) } }
    it { within('#sidebar-engines') { expect(page.body).to have_css('.administrador-link-to-engine-home', text: engine.translated_name) } }
    it { within('#sidebar-engines') { expect(page.body).to have_css('.administrador-link-to-resources', text: 'Posts') } }
  end

  describe 'engine home' do
    before(:each) do
      visit(base_path)
      within("##{dom_id(engine)}") { click_link(engine.translated_name) }
    end

    it { expect(current_path).to eq('/blorgh/') }
    it { expect(page.status_code).to eq(200) }
    it { within('#main-content') { expect(page.body).to have_css(:h3, text: 'Blorgh') } }
  end
end