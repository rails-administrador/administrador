require 'rails_helper'

RSpec.describe Administrador::BreadcrumbsViewHelper, type: :view_helper do
  context 'basic usage' do
    describe 'render' do
      it { expect(subject).to respond_to(:render) }
    end
  end
end
