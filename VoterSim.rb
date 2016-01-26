
class World

  @@voters = []
  @@politician = []
  attr_accessor :name, :party

  def initialize
    start
  end

  def start
    main_menu
    create_voter
    list_voter
    list_politician
    update_voter
    delete_voter
  end

  def main_menu
    puts  puts "M A I N  M E N U"
    puts "Welcome to the voter simulator, what would you like to do"
    puts "Please use C for create (L) for list (U) for update or (D)for delete"
    answer1 = gets.chomp.downcase

    case answer1
    when "c"
      create_voter
    when "l"
      list_voter
    when "u"
      update_voter
    when "d"
      delete_voter
    else
      puts "try again"
    end
    start
  end
  def create_voter
    puts "Ready for creating a new user, who do you want to create? (V) for voter or (P) for Politician"
    response = gets.chomp.downcase

    case response
    when "v"
      puts "What is the Name of the voter"
      voter_name = gets.chomp.downcase
      puts "What is the affiliation of the voter? Use (L) for liberal, (T) for tea party, (C) for conservative, (S) for socialist or (N) for Neutral?"
      voter_party = gets.chomp
      Voter.new(voter_name, voter_party)
      puts "thank you"

    when "p"
      puts "What is the name of the politician?"
      politician_name = gets.chomp.downcase
      puts "What is the politician's affiliation? Use (R) for republican or (D) for democrat?"
      politician_party = gets.chomp
      Politician.new(politician_name, politician_party)
      puts "thank you"
    end
    start
  end

  def list_voter
    @@voters.each do |v|
      puts "Name: #{v.name} - Party: #{v.party}"
    end
    start
  end


  def list_politicians
    @@politician.each do |p|
      puts "Name: #{p.name} - Party: #{p.party}"
    end
    start
  end

def update_voter
    puts "Please choose to update a Voter (V) or Politician(P) ?"
    answer3 = gets.chomp.downcase

    case answer3
    when "v"
      puts "Name of the person you want to update?"
      update_person = gets.chomp.downcase
      @@voters.each do |v|
        if v.name == update_person
          puts "New voter: "
          v.name = gets.chomp.downcase
          puts "Would you like to change their affilation?"
          change_views = gets.chomp.downcase
          if change_views.start_with?('y')
            puts "New view: "
            v.party = gets.chomp.downcase
          else puts "That user is not in our database"
          end
        end
        start
      end

    when "p"
      puts "Name of the politician you want to update?"
      update_politician = gets.chomp.downcase
      @@politician.each do |l|
        if l.name == update_politician
          puts "New name: "
          l.name = gets.chomp.downcase
          puts "Would you like to change their affilation?"
          change_views = gets.chomp.downcase
          if change_views.start_with?('y')
            puts "New party: "
            l.party = gets.chomp.downcase
          else puts "That user is not in our database"
          end
        end
      end
      start
    end
  end


  def delete_voter
    puts "Please choose to delete a Voter (V) or Politician (P) ?"
    answer4 = gets.chomp.downcase

    case answer4
    when "v"
      puts "Name of the person you want to delete?"
      delete_person = gets.chomp.downcase
      @@voters.delete_if do |v|
        v.name == delete_person
      end
      start


     when "p"
      puts "Name of the politician you want to delete?"
      delete_politician = gets.chomp.downcase
      @@politician.delete_if do |l| l.name == delete_politician

    end

    start
  end
  end

end

        class Voter < World
          attr_accessor :name, :party

          def initialize(name, party)
            @name = name
            @party = party
            @@voters << self
          end
        end


        class Politician < Voter
          def initialize(name, party)
            @name = name
            @party = party
            @@voters << self
            @@politician << self
          end
        end

        World.new
