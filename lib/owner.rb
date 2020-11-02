class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    name = Cat.new(cat, self)
    @cats << name
  end

  def buy_dog(dog)
    name = Dog.new(dog, self)
    @dogs << name
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.each {|dog| dog.mood = "nervous"; dog.owner = nil}
    cats.each {|cat| cat.mood = "nervous"; cat.owner = nil}
    @dogs = []
    @cats = []
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end