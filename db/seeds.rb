jenny = User.create(email: "leejenny0403@gmail.com", name: "Jenny Lee", password: "jenny", age: 24, gender: "female", description: "looking for someone to play tennis with me occasionally.  Would also like to try some olympics lifts :)")
mark = User.create(email: "mark.kilpatrick.miller@gmail.com", name: "Mark Miller", password: "mark", age: 24, gender: "male", description: "Looking for someone to lift with 6 nights a week.  I've only been lifting for a few years but can push some weight.  Looking for someone of any level, I'd love to bring a beginner or get pushed by someone more advanced.")
navraj = User.create(email: "nnat425@gmail.com", name: "Navraj Nat", password: "navraj", age: 22, gender: "male", description: "Looking to get back into the gym.  I know the basics but am looking for someone trying to get toned for beach body season")

lifting = Activity.create(name: "Lifting", image: "http://www.womenshealthmag.com/sites/womenshealthmag.com/files/images/beauty-weights-art.jpg")
tennis = Activity.create(name: "Tennis", image: "http://sport.maths.org/content/sites/sport.maths.org/files/iStock_Tennis_crop.jpg")
basketball = Activity.create(name: "Basketball", image: "http://www.rowan.edu/studentaffairs/Rec/sports/W.%20Basketball.jpg")
spin = Activity.create(name: "Spin", image: "http://heuserhealth.com/wp-content/uploads/2014/01/iStock_000012790937Medium.jpg")
soccer = Activity.create(name: "Soccer", image: "http://rezatehranicohen.info/wp-content/uploads/rezatehranicohen-info/sites/593/Document.jpeg")

mark.activities << lifting
jenny.activities << lifting
navraj.activities << lifting
jenny.activities << tennis
mark.activities << basketball
navraj.activities << basketball
jenny.activities << spin
mark.activities << spin
navraj.activities << soccer

for x in 0..100
  if x % 2 == 1
    new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8), age: Faker::Number.between(15, 45), gender: "male", description: Faker::Hacker.say_something_smart)
    new_user.activities << lifting
  else
    new_user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password(8), age: Faker::Number.between(15, 45), gender: "female", description: Faker::Hacker.say_something_smart)
    new_user.activities << spin 
  end

  if x % 7 == 0
    new_user.activities << tennis 
  end

  if x % 4 == 0
    new_user.activities << basketball 
  end
  
  if x % 11 == 0
    new_user.activities << soccer 
  end
end