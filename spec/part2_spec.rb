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

  it "should not add a new dog when using POST '/dogs?name=Spot' [20 points]" do
    post "/dogs?name=Spot"
    last_dog = Dog.last

    expect(last_dog.name).to_not eq("Spot")
  end

  it "should not add a new dog when using POST '/dogs?breed=Terrier&weight=10' [20 points]" do
    post "/dogs?breed=Terrier&weight=10"
    last_dog = Dog.last

    expect(last_dog.breed).to_not eq("Terrier")
    expect(last_dog.weight).to_not eq(10)
  end

  it "should update dogs information when using PATCH '/dogs?id=1&breed=Poodle&weight=50' [20 points]" do
    patch "/dogs?id=1&breed=Poodle&weight=50"
    bonny = Dog.get(1)

    expect(bonny.name).to eq("Bonny")
    expect(bonny.breed).to eq("Poodle")
    expect(bonny.weight).to eq(50)
  end

  it "should update dogs information when using PATCH '/dogs?id=1&weight=50' [20 points]" do
    patch "/dogs?id=1&weight=50"
    bonny = Dog.get(1)

    expect(bonny.weight).to eq(50)
  end

  it "should not delete when using DELETE '/dogs' [20 points]" do
    count = Dog.all.count
    delete "/dogs"
    expect(Dog.all.count).to eq(count)
  end

end