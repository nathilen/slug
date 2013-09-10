require 'rspec'
require 'slug'

describe 'Slug' do
  it 'should not transform words within a text' do
    text = 'onlyword'
    slug = Slug.new(text)
    expect(slug.transformed).to eq(text)
  end

  it 'should not transform digits within a text' do
    text = 'wordand13'
    expect(Slug.new(text).transformed).to eq(text)
  end 

  it 'should convert all the words to lowercase' do
    text = 'IAMUPPERCASE54'
    expect(Slug.new(text).transformed).to eq('iamuppercase54')
  end

  it 'should remove any special characters' do
    text = 'Iam%2_0!'
    expect(Slug.new(text).transformed).to eq('iam20')
  end
  
  it 'should remove space with dash(-)' do
    text = 'I am% 2_0!'
    expect(Slug.new(text).transformed).to eq('i-am-20')
  end

  it 'should not have more than one dash(-) together' do
    text = 'I    have  many   spaces!'
    expect(Slug.new(text).transformed).to eq('i-have-many-spaces')
  end

end
