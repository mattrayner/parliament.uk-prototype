require 'rails_helper'

RSpec.describe 'houses/parties/index', vcr: true do
  before do
    assign(:house, double(:house, name: 'House of Commons', graph_id: 'cqIATgUK'))
    @parties = [double(:party, name: 'Conservative', graph_id: 'jF43Jxoc', member_count: 10)]

    render
  end

  context 'header' do
    it 'will render the page title' do
      expect(rendered).to match(/Current and former parties/)
    end
  end

  context 'partials' do
    it 'will render party' do
      expect(response).to render_template(partial: 'houses/parties/_party')
    end
  end

  context 'links' do
    it 'will render house_parties_path' do
      expect(rendered).to have_link('Lords', href: house_parties_path('mG2ur5TF'))
    end
  end
end
