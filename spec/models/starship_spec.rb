describe Starship do
  it { is_expected.to have_many :person_starships }
  it { is_expected.to have_many(:people).through(:person_starships) }
end