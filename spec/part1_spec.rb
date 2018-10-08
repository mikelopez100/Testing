# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe "My application" do
  before(:all) do
    dogs=Dog.all
    dogs.each do |d|
      d.destroy
    end
    d = Dog.new
    d.name = "Bonny"
    d.breed = "Pitbull"
    d.weight = 500
    d.save

    d = Dog.new
    d.name = "Wimpy"
    d.breed = "Terrier"
    d.weight = 0
    d.save

    d = Dog.new
    d.name = "Fido"
    d.breed = "Rottweiler"
    d.weight = 200
    d.save
  end

  #list all
  it "should display all dog information when using GET '/dogs' [10 points]" do
    get "/dogs"
    dogs = Dog.all
    # Rspec 2.x
    dogs.each do |dog|
      str = "#{dog.id}: #{dog.name} - #{dog.breed} - #{dog.weight} lbs"
      expect(last_response.body).to include(str)
    end
  end

  it "should add a new dog when using POST '/dogs?name=Spot&breed=Terrier&weight=10' [10 points]" do
    post "/dogs?name=Spot&breed=Terrier&weight=10"
    last_dog = Dog.last

    expect(last_dog.name).to eq("Spot")
    expect(last_dog.breed).to eq("Terrier")
    expect(last_dog.weight).to eq(500)
  end

  it "should update dogs information when using PATCH '/dogs?id=1name=Benny&breed=Poodle&weight=50' [10 points]" do
    patch "/dogs?id=1name=Benny&breed=Poodle&weight=50"
    bonny = Dog.get(1)

    expect(bonny.name).to eq("Benny")
    expect(last_dog.breed).to eq("Poodle")
    expect(last_dog.weight).to eq(50)
  end

  it "should delete dogs information when using DELETE '/dogs?id=1" do
    dog = Dog.get(1)
    delete "/dogs?id=1"
    expect(Dog.get(1)).to eq(nil)

  end

end