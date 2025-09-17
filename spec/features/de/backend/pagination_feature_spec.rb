require 'rails_helper'

RSpec.describe '/news/items', type: :feature, js: true do
  let(:base_path) { '/news/items' }

  describe 'pagination controls' do
    describe "UI" do
      before { visit(base_path) }
      
      it { expect(page).to have_css('.pagination-controls') }
    end
  end

  describe 'pagination size' do
    describe "UI" do
      before { visit(base_path) }
      
      it { expect(page).to have_css('.pagination-size') }
    end

    describe 'selecting a different pagination size' do
      let(:collection) { create_list(:news_item, 10) }
      let(:pagination_size_select) { find('select.pagination-size', match: :first) }

      before do
        collection
        visit(base_path)
      end

      it { expect { pagination_size_select.select('5') }.to change { page.all('table.collection-table tbody tr').count }.from(10).to(5) }
    end
  end
end