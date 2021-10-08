describe Starship do
  it { is_expected.to have_many(:person_starships).dependent(:destroy) }
  it { is_expected.to have_many(:people).through(:person_starships) }
end
