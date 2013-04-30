namespace :db do
  desc "Fill questions table with sample questions"
  task populate: :environment do
    Question.create!(statement: "The view platform of the Monument was caged in after a rash of suicides in 1842", fact_or_fiction: "t")
    Question.create!(statement: "London Bridge was the first place in Britian it was mandatory to drive on the left.", fact_or_fiction: "t")
    Question.create!(statement: "Tower Hill had lions and tigers until there was an attack on a member of the garrison and they were moved to the zoo in Regents Park.", fact_or_fiction: "t")
    Question.create!(statement: "The lasat time Tower Hill held prisoners was the early 1950's.", fact_or_fiction: "t")
    Question.create!(statement: "The 1908 London Olympics is where the modern marathon distance of 26 miles was set.", fact_or_fiction: "t")
    Question.create!(statement: "The O2 dome is built on the Prime Meridian.", fact_or_fiction: "t")
    Question.create!(statement: "Battrsea Power station is the largest brick building in Europe.", fact_or_fiction: "t")
    Question.create!(statement: "The O2 is the largest dome in the world.", fact_or_fiction: "t")
    Question.create!(statement: "The marathon of the 1908 London Olympics started at Windsor in order to give the Royal family a good view.", fact_or_fiction: "t")
  end
end