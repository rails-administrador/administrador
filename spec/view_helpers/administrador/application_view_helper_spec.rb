require 'rails_helper'

RSpec.describe Administrador::ApplicationViewHelper, type: :view_helper do
  context 'basic usage' do
    describe 'engines' do
      it { expect(subject).to respond_to(:registered_engines) }
      it { expect(subject.registered_engines).to be_a(Array) }
    end

    describe 'filter_attributes_for_form' do
      let(:options) { [] }
      it { expect(subject).to respond_to(:filter_attributes_for_form) }
      it { expect(rendered).to be_a(Array) }
    end

    describe 'filter_attributes_for_show' do
      let(:options) { [] }
      it { expect(subject).to respond_to(:filter_attributes_for_show) }
      it { expect(rendered).to be_a(Array) }
    end

    describe 'flash_messages' do
      it { expect(subject).to respond_to(:flash_messages) }
      it { expect(rendered).to be_a(String) }
    end

    describe 'label_for' do
      let(:options) { OpenStruct.new(human: "Foo") }
      it { expect(subject).to respond_to(:label_for) }
      it { expect(rendered).to eq("Foo") }
    end

    describe 'render_engine_sidebars' do
      it { expect(subject).to respond_to(:render_engine_sidebars) }
      it { expect(rendered).to be_a(String) }
    end

    describe 'body_html' do
      it { expect(subject).to respond_to(:body_html) }
      it { expect(subject.body_html).to be_a(Hash) }
    end
  end
end
