# frozen_string_literal: true

RSpec.describe RotationHash do
  let(:hash_3) { RotationHash.new(3) }
  let(:hash_3_with_default) { RotationHash.new(3, 'default') }

  let(:hash_3_full) do
    { 'one' => 1, 'two' => 2, 'three' => 3 }
  end

  let(:hash_3_rotated) do
    { 'two' => 2, 'three' => 3, 'whatever' => '¯\_(ツ)_/¯' }
  end

  it 'creates Hash descendant' do
    expect(hash_3).to be_a(Hash)
  end

  it 'throws all the additional args to the internal Hash init' do
    expect(hash_3_with_default[:random]).to eq('default')
  end

  it 'adds elements as a usual Hash' do
    hash_3['one']      = 1
    hash_3['two']      = 2
    hash_3['three']    = 3

    expect(hash_3).to eq(hash_3_full)
  end

  it 'adds elements as a usual Hash' do
    hash_3['one']      = 1
    hash_3['two']      = 2
    hash_3['three']    = 3
    hash_3['whatever'] = '¯\_(ツ)_/¯'

    expect(hash_3).to eq(hash_3_rotated)
  end
end
